package com.ibm.websphere.samples.daytrader.entities;

import java.util.Arrays;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

//TODO: Put this to the test
@Entity(name = "KYCJB")
@Table(name = "KYCJB")
public class KYCBean implements java.io.Serializable {
    @Id
    @NotNull
    @Column(name = "USERID", nullable = false)
    private String userID; /* userID */
    
    
    @NotNull
    @Column(name = "KYCName",nullable = false)
    private String KYCName;
    
    private byte[] KYC;    

    @Lob @Basic(fetch= FetchType.EAGER)
    public byte[] getKYC() {
       return KYC;
    }

	public KYCBean() {
	}

	public String getUserID() {
		return userID;
	}

	public void setUserID(String userID) {
		this.userID = userID;
	}

	public void setKYC(byte[] kYC) {
		KYC = kYC;
	}

	@Override
	public String toString() {
		return "KYCBean [userID=" + userID + ", KYC=" + Arrays.toString(KYC) + "]";
	}

	public String getKYCName() {
		System.out.println("return KYCName="+KYCName);
		return KYCName;
	}

	public void setKYCName(String kYCName) {
		KYCName = kYCName;
	}
}
