package com.comunus.hungryForJob.util;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.security.spec.KeySpec;
import java.util.Base64;

import javax.crypto.Cipher;
import javax.crypto.SecretKey;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.PBEKeySpec;
import javax.crypto.spec.SecretKeySpec;

import org.apache.commons.codec.DecoderException;
import org.apache.commons.codec.binary.Hex;
import org.springframework.stereotype.Component;

import lombok.extern.log4j.Log4j2;

@Log4j2
@Component
public class EncryptUtil {
	
	private static final String SALT = "fa9b8ba73fe30d8dfcf4c59532148522";
	private static final String IV = "a715fed0af06cce82dcc1e69fc832cfe";
	private static final String PASSPHRASE = "thebestsecretkey";
	private static final int KEYSIZE = 256;
	private static final int ITERATIONCOUNT = 1000;
	
	 public String encryptRequest(byte[] bytesToEncrypt) {
			try {
				SecretKey key = generateKey(SALT, PASSPHRASE);
				byte[] encrypted = doFinal(Cipher.ENCRYPT_MODE, key, IV, bytesToEncrypt);
//				String data = "{\"data\":\""+new String(Base64.getEncoder().encode(encrypted))+"\"}";
				String data = new String(Base64.getEncoder().encode(encrypted));
	    		return data;
			} catch (Exception e) {
				log.error("error in encrypt - "+e.getMessage());
			}
			return null;
		}

		public String decryptResponse(String input) {
			try {
				SecretKey key = generateKey(SALT, PASSPHRASE);
				byte[] decrypted = doFinal(Cipher.DECRYPT_MODE, key, IV,  Base64.getDecoder().decode(input) );
				log.info("decrypt105");
				return new String(decrypted);
			} catch (Exception e) {
				log.error("error in decrypt - "+e.getMessage());
			}
			return input;
		}

		public  SecretKey generateKey(String salt, String passphrase) {
			try {
				SecretKeyFactory factory = SecretKeyFactory.getInstance("PBKDF2WithHmacSHA256");
				KeySpec spec = new PBEKeySpec(passphrase.toCharArray(), hex(salt), ITERATIONCOUNT, KEYSIZE);
				return new SecretKeySpec(factory.generateSecret(spec).getEncoded(), "AES");
			} catch (Exception e) {
				log.error("error in generateKey - "+e.getMessage());
			}
			return null;
		}
		
		public byte[] doFinal(int encryptMode, SecretKey key, String iv, byte[] bytes) {
			try {
				Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
				cipher.init(encryptMode, key, new IvParameterSpec(hex(iv)));
				return cipher.doFinal(bytes);
			} catch (Exception e) {
				log.error("error in doFinal - "+e.getMessage());			
			}
			return new byte[0];
		}

		private byte[] hex(String str) {
			try {
				return Hex.decodeHex(str.toCharArray());
			} catch (DecoderException e) {
				log.error("error in doFinal - "+e.getMessage());	
			}
			return new byte[0];
		}

		
		public static void main(String[] args) {
			 
			EncryptUtil eu=new EncryptUtil();
			String text="Comunus@123";
//			eu.encryptRequest(text.getBytes());
			log.info(eu.encryptRequest(text.getBytes()));
		}
}
