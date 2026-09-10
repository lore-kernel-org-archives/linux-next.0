Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2E983812C7
	for <linux-next@vger.kernel.org>; Thu, 10 Sep 2026 02:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789007421; cv=none; b=pPOBQccuLuyhElgieh15uovf4D3Wc5ecrimO3Tho3z42DMLmXMSiDe2lWXjZRUp5sWI45XUA59TNsgvqUdC5OYwqUZokqCtaE6vzOcomXsNm9it8jRI6vrmY/XCLl4sxETvPK3cs6FumouGy1gS+l4iDJ40l/3n975hh1Or30uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789007421; c=relaxed/simple;
	bh=l9UVq4R94kAGMW/KDfh/vvyvuUWsyfSCKVdcZM9ZoBE=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=tlfW50OgxcDtJqRPTQstvNPfZv4MOdAz526DP73rVGw7d61HkTIT0tCEDaHGFd+o7mQmJfGyxevx0uV2K/ANYiKezGwASnxmt/GRyNOUoYLg8ky/i7EQey2NV4aAnQFKi56n/hTxbQLswiGxNDATZGd3QGnWqgAo9y0cu6KQYDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=E1PKePXA; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="E1PKePXA"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-869d181419bso37353b3a.2
        for <linux-next@vger.kernel.org>; Wed, 09 Sep 2026 19:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1789007419; x=1789612219; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PshwfpJyDLTz5mvOLb2clB9nhzEQoxAmnklzeJ5cm5w=;
        b=E1PKePXAyrxK8nuVzN8tdwZYtrcGCSvHYLeiLMuacuE4kpfaXgIe+rs39dc1SbSdhX
         Z4+CArOTTK8plzwQIo40gMB2egk9AhWD1K9qFIavhkDEGd1+Rebasrytz2gMmn242WBC
         Nj09J5OdWFyEIX82ULiCcnZ+V+gb5ivZLLns4qxdczEt/5uUAAmHgJZx6yahdT7ZJYR7
         msmqxdwU6BX30rbfNMRdtcROfMus4ieZVe70ZGyNYZFyzKtO3yaPABEf9rIHMnOPFzp+
         qCqvyE3n9Qp4EYyNdN2JYYRJQT5fLj6xWUA1VwFgRhZnvglpafpWuNpMFmoCFNakU1uo
         Hiuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789007419; x=1789612219;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PshwfpJyDLTz5mvOLb2clB9nhzEQoxAmnklzeJ5cm5w=;
        b=RgN5TZqFp+NWSF8L3bJsZ94UANIR+NAE41Mamo0/1ydkuZE5myH0lZQXh7FOajStYu
         wWAzSihUyBNhD17H3KyqE8fIgKku8v2nDMzeV17GWiqRvZiIEadsWaqIMCXPCMW0nUkh
         KC2cijRBa+kzp58xATEEx4kgNxEOaKuv8+tD836rR6COH9KZdUMpAiTzYgk6L2PGZo5S
         QVxtkotAHaN6j1dKF4driL8G+lj8oAETPwGyZGJ5+Q66bulv5rjWQe1+fK/48vyaKR/G
         T8cN0GJoTevNTXG3vDt6CqsU2xavKhqCSSILVlZ0r0065qrTEGpnOAABwJy0agg5/4Fl
         rgrQ==
X-Gm-Message-State: AFuF++kDgGxeK1J4QwoCz9q0yT7WfEJSnU8il0YqHeKhMWivoq3b9KDp
	8r3rn79qaWU2vQR7KZqh3WAkIP6tb7wqRk3KGZby0eR/AQzCjSC6bLEqju5+mhdrfFAOmLs4aXh
	/0gad
X-Gm-Gg: AYBFou0ANlnMHzFfi7JmHGvUfHHUlQi04OKX6eAzdbC4icZLMwVTG5K5vt9ySbkb/GJ
	Oo6iIuoKeQLxiQtjZfE3qTqKjm0RX2ZhcVeLHnxvDzWAF+5sOoBNBtYiRAPVRlhhUacIqtMhSHC
	LBso2QHlqb+dHNVkFr6braoi1msAt+bT0S5lQBKXfGsZ89KyBfP3LI49d+KPNCxnAP3Z/KanoaB
	OB2oPhvBxClod8XJlsMtyrMboTCoFlE7GqEl7+QwzzAuLgMOM6ddac24AiPTPa30ti3C2u+ExwD
	NktWt5oB/6gQdjh6MG6E4oVOYVI9dtMrFiC3GnKbR9hc4uo9P//zAigaX/ANCYG7+Sk5Dvu+5bP
	H0FaZDY3Vf/L+UMEGbrCl9O1zjCesMuIrqtvLNuPzT3sZ9iHe7Kr/IHiMz2x8ZwtncFNQXcGutg
	26PyNxvnaS1M1vYwF7RX+XnuyoEQrfW0wrwVcCf8Xe997jPidWSBzX22PCaHwmbRI=
X-Received: by 2002:a05:6a21:6442:b0:3da:5b4d:a89f with SMTP id adf61e73a8af0-3da5b4dab37mr39692956637.27.1789007418827;
        Wed, 09 Sep 2026 19:30:18 -0700 (PDT)
Received: from 41049dfc76e5 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-333c9db92b1sm48233878eec.9.2026.09.09.19.30.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 19:30:18 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - c68a982815dcce5464e3bf2a31ac94f5146c04ca
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Thu, 10 Sep 2026 02:30:17 -0000
Message-ID: <178900741745.3688.6230854249159337702@41049dfc76e5>



Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/c68a982815dcce5464e3bf2a31ac94f5146c04ca/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: c68a982815dcce5464e3bf2a31ac94f5146c04ca
origin: maestro
test start time: 2026-09-09 15:04:53.315000+00:00

Builds:	   70 ✅    2 ❌    0 ⚠️
Boots: 	  163 ✅    1 ❌    0 ⚠️
Tests: 	29822 ✅ 5049 ❌ 4553 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: cd8180-orion-o6
  > Config: defconfig+netdev+nfs-root-boot+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:6aa18346e41d7f97d61bdc26
      history:  > ✅  > ✅  > ✅  > ❌  
            
Hardware: qcs8300-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.futex
      last run: https://d.kernelci.org/test/maestro:6aa18229e41d7f97d61bd868
      history:  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_global_requeue_multiple
      last run: https://d.kernelci.org/test/maestro:6aa1a2ace41d7f97d61ca7b5
      history:  > ✅  > ❌  
            
Hardware: hamoa-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.device-error-logs
      last run: https://d.kernelci.org/test/maestro:6aa18206e41d7f97d61bd731
      history:  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_iommu_3da0000
      last run: https://d.kernelci.org/test/maestro:6aa1c70320239ade901901e2
      history:  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_global_requeue_single
      last run: https://d.kernelci.org/test/maestro:6aa1c9f220239ade90191c07
      history:  > ✅  > ❌  
            
Hardware: kaanapali-mtp
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.futex
      last run: https://d.kernelci.org/test/maestro:6aa1822ce41d7f97d61bd879
      history:  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_global_requeue_multiple
      last run: https://d.kernelci.org/test/maestro:6aa1b2d7e41d7f97d61d4b3c
      history:  > ✅  > ❌  
            
      - kselftest.timers.timers_set-timer-lat
      last run: https://d.kernelci.org/test/maestro:6aa1ba7fe41d7f97d61e1135
      history:  > ✅  > ❌  
            
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.ring-buffer
      last run: https://d.kernelci.org/test/maestro:6aa1818ee41d7f97d61bd2a5
      history:  > ✅  > ❌  
            
Hardware: sm8750-mtp
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_iommu_3da0000
      last run: https://d.kernelci.org/test/maestro:6aa19347e41d7f97d61c70e3
      history:  > ✅  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: lemans-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.devices-exist
      last run: https://d.kernelci.org/test/maestro:6aa18270e41d7f97d61bda73
      history:  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_iommu_3da0000
      last run: https://d.kernelci.org/test/maestro:6aa1ab37e41d7f97d61d3954
      history:  > ❌  > ✅  
            
Hardware: qemu-arm64
  > Config: defconfig+netdev+nfs-root-boot+kselftest
    - Architecture/compiler: arm64/gcc-15
      - ltp
      last run: https://d.kernelci.org/test/maestro:6aa18346e41d7f97d61bdc20
      history:  > ❌  > ❌  > ✅  > ✅  > ✅  
            
Hardware: hamoa-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.futex.futex_run_sh
      last run: https://d.kernelci.org/test/maestro:6aa1c9f220239ade90191bd4
      history:  > ❌  > ✅  
            
Hardware: mt8183-kukui-jacuzzi-juniper-sku16
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_firmware_coreboot
      last run: https://d.kernelci.org/test/maestro:6aa1a9abe41d7f97d61d2f87
      history:  > ❌  > ✅  > ✅  
            
Hardware: mt8195-cherry-tomato-r2
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_firmware_coreboot
      last run: https://d.kernelci.org/test/maestro:6aa1a65be41d7f97d61d07bb
      history:  > ❌  > ❌  > ✅  
            


### UNSTABLE TESTS
    
Hardware: meson-g12b-a311d-khadas-vim3
  > Config: defconfig+preempt_rt
    - Architecture/compiler: arm64/gcc-14
      - rt-tests.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6aa192d0e41d7f97d61c6d63
      history:  > ❌  > ✅  > ❌  > ❌  
            
      - rt-tests.rt-migrate-test.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6aa1935de41d7f97d61c71f6
      history:  > ❌  > ✅  > ❌  > ❌  
            



This branch has 1 pre-existing build issues. See details in the dashboard.

Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
