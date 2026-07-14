Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1612929408
	for <linux-next@vger.kernel.org>; Tue, 14 Jul 2026 02:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783996247; cv=none; b=myJr9m4oLl0aopORxip/PJciPR9pkJHpvykHEB7xKw0eUjAEiicATCzRHN8ZcAIyiHqT0wwkPr0eSaJR4vL6oGursMo13iDht/w+lH1XKCxNxcxyxo7NwNRbhcxbjsw54I2Vg+Ob4bVqjSbh5E6vqghYN6SxXjd6pMesrpiOT4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783996247; c=relaxed/simple;
	bh=XvpgjMy8M5419c/j+ejVNu9BSC5gsGYzmTiAm/Z2djY=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=DetCLOVPLldS/c0dyeOCZFg1/NsOCnT3MCzGVfyMzL0gNXRha874a625x1ZMyl+QjBBygkED0ZYEJSphTwtyg4CM4HwLwehuBez1CUq11vNtbSdkR3p5PrzPt3zdLCWHJpJv60hoONT7jsj/ZUm70UuD9J0GfdMBV+hqh70PVQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=Rq74PRNm; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="Rq74PRNm"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-ca97d139d5fso2722103a12.0
        for <linux-next@vger.kernel.org>; Mon, 13 Jul 2026 19:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1783996244; x=1784601044; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=55alBzJoNn0B51AUbv3yjRHue+7Y9L5pf/3jgjl6nWY=;
        b=Rq74PRNm4oq63tynZWQ+1MrLuB+jdlF9wkGzsHkDlEYeweXGah71lxCyoeFh72UuWe
         5+Guev/Qm4MFhRHukLL7DHM6yj59QRjeCUjXKpNxG4GZf+vk4yLWUsHTdYxRIxnoby3U
         Qr39If5YjP8k+XQEdEayDvbOvsJQne64f7W/cLk82pEXEqH89iPDpSX7uIJC+fBN10Tv
         87CsTzqdmbW2zm1BSSxqV1dTDjNtQpNbDQuFetF3nfltPVuA2phKYFihNDStGht5SdSF
         h8bnRlVUUhunC5rR5QgCQf/jZyPPZ7Logw1qFeheylRciSYmAb4bosVq0iyJKjp2nVdd
         i96g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783996244; x=1784601044;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=55alBzJoNn0B51AUbv3yjRHue+7Y9L5pf/3jgjl6nWY=;
        b=eZqHQFqG+t3qjC3mbIHEv4RbKp8UAA+JdU+ofWD5q6mHoj95EAodbV+ktJGIGydrYb
         rxQJPTBtODWNMdzND3BzfhvM/LZdpwdnz/g491iYyEkMlxCiPXftMi1DYzI5V87nV+UQ
         /upsi8C3lk0ZatA1UstzFyuXi50xEhU35qvxQa/b2t6QcfNIJcj6blFhwXgJrGiPc3Wn
         O0JOaMBm6eYXCwhc/1gKzdCifCiOd3giviTMe9n6WF5ufTDusvAVb13HrUB99pi7Z7BD
         3LV06WkIK9LHabog9c4BgW+udRYF+IPLXosDngIbuvE983XQ5v5Nl2fBuE9GomX0OgB/
         7alw==
X-Gm-Message-State: AOJu0YyTYmKphvfDDW8IWGmqLWl050oScTCtr6ioQg52MLYuoAOIxeqQ
	XlwYV652l4NENAxecuiC6BJ7T02kZodfLO0nMaIZJ7k+3Ghg2uPpBHurhtjCXTR1qvU=
X-Gm-Gg: AfdE7cmEQ3DDBkWgFVKI4umxoXzfe2zwLYm/Kj6qszLTWt1jEvIoIPl3ID5cYEfLxF/
	aOTHl3tnyDjzF011txTd2U1I3GDqNndopn5yikZFxnLnt4cdmVxAUmkhFA4pcT4iyBDhGaphJt8
	pkmA8a7DcmLiM2tsh9UI75mxBgF6LOmdzrHJC94vtfpSrl4IiAyfjRfqDL1mIWEjIaA84fps0/z
	fnPqxnkgX3TMe8a8mYgZb4plih0xgCj0tF1ZVpMybsh5GnA3wZbRS+gOUrTMjkTMwfABOQpLdNh
	VX0I4VAWAbsG+iJ0dcOAbtGOx7Y7S6c2M7cKU2dcCglsKYb5JwpnEaMh/JunG2QKmSZb9YX6vCZ
	CYPMpi2F9Zm5ir52yJbe3sKpmXVSHcAEm1142Xgg6NHvQVTwTvltcvAmmE//OVade9pbIo0ZqwZ
	ZWcuLDLg==
X-Received: by 2002:a05:6a21:1b81:b0:3bd:394d:addd with SMTP id adf61e73a8af0-3c35741cee1mr423044637.33.1783996244421;
        Mon, 13 Jul 2026 19:30:44 -0700 (PDT)
Received: from 963b246bc1b3 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31189cd8234sm67499132eec.9.2026.07.13.19.30.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 19:30:43 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - 49362394dad7df66c274c867a271394c10ca2bb8
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Tue, 14 Jul 2026 02:30:43 -0000
Message-ID: <178399624334.10257.9435479886359813117@963b246bc1b3>



Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/49362394dad7df66c274c867a271394c10ca2bb8/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 49362394dad7df66c274c867a271394c10ca2bb8
origin: maestro
test start time: 2026-07-13 18:04:34.745000+00:00

Builds:	   72 ✅    2 ❌    0 ⚠️
Boots: 	  109 ✅    1 ❌    0 ⚠️
Tests: 	29725 ✅ 5410 ❌ 6310 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: qcs6490-rb3gen2
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.gpio
      last run: https://d.kernelci.org/test/maestro:6a553b4a18a4add1353b3469
      history:  > ✅  > ❌  > ❌  > ❌  
            
Hardware: bcm2711-rpi-4-b
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.kvm.shardfile-kvm
      last run: https://d.kernelci.org/test/maestro:6a556a0d18a4add1353d0133
      history:  > ✅  > ❌  
            
Hardware: k3-am625-verdin-wifi-mallow
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.kvm.shardfile-kvm
      last run: https://d.kernelci.org/test/maestro:6a5550e618a4add1353c5af8
      history:  > ✅  > ❌  
            
Hardware: sun50i-a64-pine64-plus
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.kvm.shardfile-kvm
      last run: https://d.kernelci.org/test/maestro:6a55459918a4add1353c0c88
      history:  > ✅  > ❌  
            
Hardware: mt8183-kukui-jacuzzi-juniper-sku16
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller0_14001000
      last run: https://d.kernelci.org/test/maestro:6a553a6818a4add1353b2d0d
      history:  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dsi_14014000
      last run: https://d.kernelci.org/test/maestro:6a553a6818a4add1353b2d09
      history:  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_i2c_11008000_anx7625_58
      last run: https://d.kernelci.org/test/maestro:6a553a6818a4add1353b2d01
      history:  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_i2c_11008000_anx7625_58_aux-bus_panel
      last run: https://d.kernelci.org/test/maestro:6a553a6818a4add1353b2d00
      history:  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_ovl_14008000
      last run: https://d.kernelci.org/test/maestro:6a553a6718a4add1353b2ce4
      history:  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_ovl_14009000
      last run: https://d.kernelci.org/test/maestro:6a553a6718a4add1353b2ce3
      history:  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_ovl_1400a000
      last run: https://d.kernelci.org/test/maestro:6a553a6718a4add1353b2ce2
      history:  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_rdma_1400b000
      last run: https://d.kernelci.org/test/maestro:6a553a6718a4add1353b2cd7
      history:  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_rdma_1400c000
      last run: https://d.kernelci.org/test/maestro:6a553a6818a4add1353b2d57
      history:  > ✅  > ❌  
            
Hardware: sc7180-trogdor-kingoftown
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_remoteproc_4080000
      last run: https://d.kernelci.org/test/maestro:6a5536de18a4add1353afbd3
      history:  > ✅  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: qcs6490-rb3gen2
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_iommu_3da0000
      last run: https://d.kernelci.org/test/maestro:6a55465518a4add1353c15ef
      history:  > ❌  > ✅  > ✅  > ✅  
            
Hardware: bcm2837-rpi-3-b-plus
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.device_error_logs
      last run: https://d.kernelci.org/test/maestro:6a55370e18a4add1353b0ad5
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.device_error_logs.devices_error_logs_test_device_error_logs_py
      last run: https://d.kernelci.org/test/maestro:6a5546d218a4add1353c1791
      history:  > ❌  > ✅  > ✅  
            
Hardware: imx8mp-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.alsa.alsa_mixer-test_write_default_wm8960audio_69
      last run: https://d.kernelci.org/test/maestro:6a55464c18a4add1353c11e7
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.alsa.alsa_mixer-test_write_default_wm8960audio_71
      last run: https://d.kernelci.org/test/maestro:6a55464c18a4add1353c11f5
      history:  > ❌  > ✅  > ✅  
            


### UNSTABLE TESTS
    
Hardware: qcs6490-rb3gen2
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.breakpoints
      last run: https://d.kernelci.org/test/maestro:6a5536e018a4add1353afec9
      history:  > ❌  > ✅  > ❌  > ❌  
            
Hardware: imx8mp-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.alsa.alsa_pcm-test
      last run: https://d.kernelci.org/test/maestro:6a55464c18a4add1353c0f8d
      history:  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_sound-wm8960
      last run: https://d.kernelci.org/test/maestro:6a5549c818a4add1353c4b81
      history:  > ✅  > ❌  > ✅  
            



This branch has 1 pre-existing build issues. See details in the dashboard.

Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
