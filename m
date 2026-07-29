Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5351F37F01D
	for <linux-next@vger.kernel.org>; Wed, 29 Jul 2026 02:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785292220; cv=none; b=GotE5DW0dLcM6QTz+8SZS2bN+ZFK7e4IOIKWJJRTvywEgxNySJkXiNVHkeBbhTdr8AckhFPCtLGHw2n6vSVql9uWSD/6L9izTVhwtrwYmDC+uiI0wpU40r+Hg5BaCja91tWgXpqKhXMV/niyPLMsFrmVzDKbpx5hZVTrliwkC8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785292220; c=relaxed/simple;
	bh=AUY3kNhbH7u0PtPQXNLhLUPUmTA8tE00mfPwWvgNxkg=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=dUB43lWP/jQjhWuc+tAKiRvnLA61QOTeUtmV6dNa817auhQUdkIDmDThAbB8wvvesO4PrM7jK35ON+FADU1J5YMh/BUUYm5lfFD3hgZkYo+yTUgJS5VzJgFrWioh4KIPlh04pB0phQZl49wTNj0VSuvmCrLf8fWRWy9eRzUD0o8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=FVN/1Eou; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="FVN/1Eou"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8486ac3f347so1599330b3a.1
        for <linux-next@vger.kernel.org>; Tue, 28 Jul 2026 19:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1785292216; x=1785897016; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4eJrKqV8BgDwJakda2QgDd1W2V5s3ObaD4KJJ5Fr7Do=;
        b=FVN/1EoufhJkMBDQaej8XudQobT3h5QY5Z5o5LbCR8rGXwMkoxsDZVn6jDtlpdh3pp
         s/0kaQ+WuT5GTZ5cwq7hQaSasf3ziYN8mRgJ9VrBQK230AXPsWwmgUqvbQrCP8LRk0Wr
         JiYROfaFsKOAOVf+K2q1mxHd7RIaOZqcBpKQvqlb4mymao5/IDapIxum0bd9vzm8z+G0
         3pqvy/lEzYpMkk9U+hwMWMZNIMBi2m6aZvsulUMBwzXHiog9Hgh5EHE3xHLH0faowkrD
         WGSfDwtaytcfpogG57oWvD1TNRNHx+LY6Mzp5V0OpLTMvPKknI0W5T3Jpri203kHjypH
         N3Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785292216; x=1785897016;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4eJrKqV8BgDwJakda2QgDd1W2V5s3ObaD4KJJ5Fr7Do=;
        b=Zf4fki75ZWSntssL90vmgfIOlomKuiPT+bOMACozr+8Qj7WyENqXhyBP9nf2Yy8Xg6
         MK5Dxdg4TvE0MC4VOwXM+PwLACD7iwVEaOEhv9c2UaKOdT4jaVk+uS7hmDM+CcaHayHM
         +PU7lQnMo03DF5md71cpaRzEFwOOLyBXTRzswfU9a1WKhLaZB+x/5KCEgVIpwcE1dJIo
         ZT40TZrPcb7hwJW5d4ENd4Dl7YCk11guUSdUqlX3zvu4Vk8TQJzLM7/dHKmn219OPipt
         JdQ53fLIisNfuZb19LTHXIjGYMGQ88MsNmBot6qAHlBRfTkpndJbh20ooq/BcWCT7mcC
         et+g==
X-Gm-Message-State: AOJu0Yz4dbjXJv9qJEeutCOVxCzmp1wyyZBpEn5bg+yKA3G5mi1SI4kq
	rKe0Ymdu+K9C3az4aMlmQDiK5VPO9B+tHGcaaLYjBbH7e9SfAnwKM2rpOS2VV5KDI1vCVHpWvNM
	nk1c3
X-Gm-Gg: AR+sD12Jumr9j/L7nfQlsVay7cKE/kyVYLfNwTUI02WbOCUvz6eQOR67KYsqPawRbmc
	qNHIeNi1rIoJht+cVAWYFYdJsb3BOyQxR8KvdNJ547zPO2/CP4UvnZQ49Rqk52p0CA2QYv72DSi
	fSuN0HP+H8EWJwJCJeHrNx6SBU94AyCf9Ho4snrJEV/GuoZt8y7deMkwMTs6Tf8L4HHmEtiSnRa
	BkgeWQ6R/fiRwuyylFkW6wu++AUBk+xUor9EZHeM1/YZ78THDFC/BEZOIPydCNXQS4/1JagYW5X
	LBskuIGMsElPcnK3fuw3npcfahaJSxrMyWzIpC9/fm1QCP8yPpavuE5zAjbPnjEpRGR+CMf6dh1
	lLn0EjEnZKSMcqdGaCZIDNi4UPsxlOpGa9u5F+Tbq0p9OFUQ+FWKKiTfWIc8G0SC4vrXq/zjlT0
	k+3ltgSKLLfgGUFCh2UZUJ9O65zqjibLN4/im37qYFWYA8OP/wUfdgew==
X-Received: by 2002:a05:6a21:6a0d:b0:3c4:2cd3:f0ba with SMTP id adf61e73a8af0-3c8e4880f73mr516396637.31.1785292216232;
        Tue, 28 Jul 2026 19:30:16 -0700 (PDT)
Received: from 92650adf53de ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31504d480c5sm5250296eec.25.2026.07.28.19.30.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 19:30:15 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - 3652b49adac266a3d27cb41cdfdb7d8790fc3633
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Wed, 29 Jul 2026 02:30:15 -0000
Message-ID: <178529221476.3294.1234533442990409052@92650adf53de>



Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/3652b49adac266a3d27cb41cdfdb7d8790fc3633/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 3652b49adac266a3d27cb41cdfdb7d8790fc3633
origin: maestro
test start time: 2026-07-28 19:01:24.366000+00:00

Builds:	   72 ✅    2 ❌    0 ⚠️
Boots: 	  156 ✅    3 ❌    0 ⚠️
Tests: 	28466 ✅ 2544 ❌ 5526 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: bcm2837-rpi-3-b-plus
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.proc
      last run: https://d.kernelci.org/test/maestro:6a6919f1798ea6c1ef80582d
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
      - kselftest.proc.proc_proc-self-map-files-001
      last run: https://d.kernelci.org/test/maestro:6a694687798ea6c1ef82fade
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
      - kselftest.proc.proc_proc-self-map-files-002
      last run: https://d.kernelci.org/test/maestro:6a694687798ea6c1ef82fadd
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
Hardware: meson-g12b-a311d-khadas-vim3
  > Config: defconfig+preempt_rt
    - Architecture/compiler: arm64/gcc-14
      - rt-tests.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6a690625798ea6c1ef7f73b0
      history:  > ✅  > ✅  > ❌  > ❌  > ❌  
            
      - rt-tests.rt-migrate-test.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6a6906a3798ea6c1ef7f79c4
      history:  > ✅  > ✅  > ❌  > ❌  > ❌  
            
Hardware: qcs8300-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.devices-exist
      last run: https://d.kernelci.org/test/maestro:6a691a75798ea6c1ef807ba9
      history:  > ✅  > ✅  > ❌  > ❌  > ❌  
            
      - kselftest.devices-probe
      last run: https://d.kernelci.org/test/maestro:6a691a83798ea6c1ef8087eb
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.futex
      last run: https://d.kernelci.org/test/maestro:6a691a26798ea6c1ef805cc4
      history:  > ✅  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.futex.futex_run_sh_global_requeue_multiple
      last run: https://d.kernelci.org/test/maestro:6a692ccb798ea6c1ef821458
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.proc
      last run: https://d.kernelci.org/test/maestro:6a691a35798ea6c1ef805d09
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
      - kselftest.proc.proc_proc-self-map-files-001
      last run: https://d.kernelci.org/test/maestro:6a692d06798ea6c1ef8219ed
      history:  > ✅  > ❌  > ❌  > ❌  
            
      - kselftest.proc.proc_proc-self-map-files-002
      last run: https://d.kernelci.org/test/maestro:6a692d06798ea6c1ef8219ec
      history:  > ✅  > ❌  > ❌  > ❌  
            
Hardware: qcs9100-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_22000000_display-controller_22001000
      last run: https://d.kernelci.org/test/maestro:6a694740798ea6c1ef82fcfc
      history:  > ✅  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000
      last run: https://d.kernelci.org/test/maestro:6a694740798ea6c1ef82fcf7
      history:  > ✅  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_display-controller_ae01000
      last run: https://d.kernelci.org/test/maestro:6a694740798ea6c1ef82fcf6
      history:  > ✅  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_dsi_ae94000
      last run: https://d.kernelci.org/test/maestro:6a694740798ea6c1ef82fcf1
      history:  > ✅  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_dsi_ae96000
      last run: https://d.kernelci.org/test/maestro:6a694740798ea6c1ef82fcef
      history:  > ✅  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_phy_ae94400
      last run: https://d.kernelci.org/test/maestro:6a694740798ea6c1ef82fcee
      history:  > ✅  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_phy_ae96400
      last run: https://d.kernelci.org/test/maestro:6a694740798ea6c1ef82fced
      history:  > ✅  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_geniqup_8c0000_i2c_890000_i2c-mux_70_i2c_0_bridge_58
      last run: https://d.kernelci.org/test/maestro:6a694740798ea6c1ef82fccf
      history:  > ✅  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_geniqup_8c0000_i2c_890000_i2c-mux_70_i2c_1_bridge_58
      last run: https://d.kernelci.org/test/maestro:6a694740798ea6c1ef82fcce
      history:  > ✅  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_geniqup_8c0000_serial_88c000_bluetooth
      last run: https://d.kernelci.org/test/maestro:6a694740798ea6c1ef82fccc
      history:  > ✅  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_pcie_1c00000
      last run: https://d.kernelci.org/test/maestro:6a694740798ea6c1ef82fcad
      history:  > ✅  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_pcie_1c00000_pcie_0
      last run: https://d.kernelci.org/test/maestro:6a694740798ea6c1ef82fcac
      history:  > ✅  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_video-codec_aa00000
      last run: https://d.kernelci.org/test/maestro:6a694740798ea6c1ef82fc29
      history:  > ✅  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.proc
      last run: https://d.kernelci.org/test/maestro:6a691a36798ea6c1ef805d14
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
      - kselftest.proc.proc_proc-self-map-files-001
      last run: https://d.kernelci.org/test/maestro:6a694e5f798ea6c1ef83490a
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
      - kselftest.proc.proc_proc-self-map-files-002
      last run: https://d.kernelci.org/test/maestro:6a694e5f798ea6c1ef834909
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
Hardware: sm8750-mtp
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.proc
      last run: https://d.kernelci.org/test/maestro:6a691a38798ea6c1ef805d17
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
      - kselftest.proc.proc_proc-self-map-files-001
      last run: https://d.kernelci.org/test/maestro:6a69274d798ea6c1ef81b737
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
      - kselftest.proc.proc_proc-self-map-files-002
      last run: https://d.kernelci.org/test/maestro:6a69274d798ea6c1ef81b736
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
Hardware: kaanapali-mtp
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_9800000
      last run: https://d.kernelci.org/test/maestro:6a6927f1798ea6c1ef81bcc8
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_9800000_display-controller_9801000
      last run: https://d.kernelci.org/test/maestro:6a6927f1798ea6c1ef81bcc7
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_9800000_dsi_9ac0000
      last run: https://d.kernelci.org/test/maestro:6a6927f1798ea6c1ef81bcc5
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_9800000_dsi_9ac0000_panel_0
      last run: https://d.kernelci.org/test/maestro:6a6927f1798ea6c1ef81bcc3
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_9800000_phy_9ac1000
      last run: https://d.kernelci.org/test/maestro:6a6927f1798ea6c1ef81bcc2
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.proc
      last run: https://d.kernelci.org/test/maestro:6a691a39798ea6c1ef805d21
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
      - kselftest.proc.proc_proc-self-map-files-001
      last run: https://d.kernelci.org/test/maestro:6a692906798ea6c1ef81c742
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
      - kselftest.proc.proc_proc-self-map-files-002
      last run: https://d.kernelci.org/test/maestro:6a692906798ea6c1ef81c741
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
Hardware: qcs615-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.proc
      last run: https://d.kernelci.org/test/maestro:6a691a33798ea6c1ef805d03
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
      - kselftest.proc.proc_proc-self-map-files-001
      last run: https://d.kernelci.org/test/maestro:6a693aad798ea6c1ef825dcb
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
      - kselftest.proc.proc_proc-self-map-files-002
      last run: https://d.kernelci.org/test/maestro:6a693aad798ea6c1ef825dca
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
Hardware: qcs6490-rb3gen2
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.coredump
      last run: https://d.kernelci.org/test/maestro:6a6919f8798ea6c1ef805a65
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
      - kselftest.device-error-logs
      last run: https://d.kernelci.org/test/maestro:6a691a0d798ea6c1ef805bcd
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
      - kselftest.proc
      last run: https://d.kernelci.org/test/maestro:6a691a34798ea6c1ef805d06
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
      - kselftest.proc.proc_proc-self-map-files-001
      last run: https://d.kernelci.org/test/maestro:6a692c0a798ea6c1ef820f10
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
      - kselftest.proc.proc_proc-self-map-files-002
      last run: https://d.kernelci.org/test/maestro:6a692c0a798ea6c1ef820f21
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
Hardware: lemans-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_audio-codec-0
      last run: https://d.kernelci.org/test/maestro:6a6947e3798ea6c1ef830007
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_audio-codec-1
      last run: https://d.kernelci.org/test/maestro:6a6947e3798ea6c1ef830006
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_reboot-mode
      last run: https://d.kernelci.org/test/maestro:6a6947e3798ea6c1ef82ffe2
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_regulator-usb0-vbus
      last run: https://d.kernelci.org/test/maestro:6a6947e3798ea6c1ef82ffe0
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_regulator-usb1-vbus
      last run: https://d.kernelci.org/test/maestro:6a6947e3798ea6c1ef82ffdf
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_regulator-vreg-sdc
      last run: https://d.kernelci.org/test/maestro:6a6947e3798ea6c1ef82ffdc
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_clock-controller_abf0000
      last run: https://d.kernelci.org/test/maestro:6a6947e3798ea6c1ef82ffcf
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_clock-controller_ade0000
      last run: https://d.kernelci.org/test/maestro:6a6947e3798ea6c1ef82ffce
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_clock-controller_af00000
      last run: https://d.kernelci.org/test/maestro:6a6947e3798ea6c1ef82ffcd
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_geniqup_8c0000_i2c_890000
      last run: https://d.kernelci.org/test/maestro:6a6947e3798ea6c1ef82ffb1
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_geniqup_8c0000_i2c_890000_gpio_38
      last run: https://d.kernelci.org/test/maestro:6a6947e3798ea6c1ef82ffae
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_geniqup_8c0000_i2c_890000_gpio_39
      last run: https://d.kernelci.org/test/maestro:6a6947e3798ea6c1ef82ffad
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_geniqup_8c0000_i2c_890000_gpio_3a
      last run: https://d.kernelci.org/test/maestro:6a6947e3798ea6c1ef82ffac
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_geniqup_8c0000_i2c_890000_gpio_3b
      last run: https://d.kernelci.org/test/maestro:6a6947e3798ea6c1ef82ffab
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_gpu_3d00000
      last run: https://d.kernelci.org/test/maestro:6a6947e3798ea6c1ef82ff9b
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_pmu_9091000
      last run: https://d.kernelci.org/test/maestro:6a6947e3798ea6c1ef82ff77
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_pmu_90b5400
      last run: https://d.kernelci.org/test/maestro:6a6947e3798ea6c1ef82ff75
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_pmu_90b6400
      last run: https://d.kernelci.org/test/maestro:6a6947e3798ea6c1ef82ff73
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_regulator_891c000
      last run: https://d.kernelci.org/test/maestro:6a6947e3798ea6c1ef82ff71
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_remoteproc_21c00000
      last run: https://d.kernelci.org/test/maestro:6a6947e3798ea6c1ef82ff6b
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_remoteproc_26300000
      last run: https://d.kernelci.org/test/maestro:6a6947e3798ea6c1ef82ff66
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_remoteproc_2a300000
      last run: https://d.kernelci.org/test/maestro:6a6947e3798ea6c1ef82ff5a
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_remoteproc_30000000
      last run: https://d.kernelci.org/test/maestro:6a6947e2798ea6c1ef82ff4a
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_spmi_c440000_pmic_0_nvram_7100
      last run: https://d.kernelci.org/test/maestro:6a6947e2798ea6c1ef82ff31
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_spmi_c440000_pmic_0_pon_1200
      last run: https://d.kernelci.org/test/maestro:6a6947e2798ea6c1ef82ff30
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_spmi_c440000_pmic_0_pon_1200_pwrkey
      last run: https://d.kernelci.org/test/maestro:6a6947e2798ea6c1ef82ff2f
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_spmi_c440000_pmic_0_pon_1200_resin
      last run: https://d.kernelci.org/test/maestro:6a6947e2798ea6c1ef82ff2e
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_spmi_c440000_pmic_0_rtc_6100
      last run: https://d.kernelci.org/test/maestro:6a6947e2798ea6c1ef82ff2d
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_spmi_c440000_pmic_0_temp-alarm_a00
      last run: https://d.kernelci.org/test/maestro:6a6947e2798ea6c1ef82ff2c
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_spmi_c440000_pmic_2_temp-alarm_a00
      last run: https://d.kernelci.org/test/maestro:6a6947e2798ea6c1ef82ff29
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_spmi_c440000_pmic_4_temp-alarm_a00
      last run: https://d.kernelci.org/test/maestro:6a6947e2798ea6c1ef82ff26
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_spmi_c440000_pmic_6_temp-alarm_a00
      last run: https://d.kernelci.org/test/maestro:6a6947e2798ea6c1ef82ff23
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_sram_c3f0000
      last run: https://d.kernelci.org/test/maestro:6a6947e2798ea6c1ef82ff20
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_system-cache-controller_9200000
      last run: https://d.kernelci.org/test/maestro:6a6947e2798ea6c1ef82ff1d
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.proc
      last run: https://d.kernelci.org/test/maestro:6a691a3a798ea6c1ef805d24
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
      - kselftest.proc.proc_proc-self-map-files-001
      last run: https://d.kernelci.org/test/maestro:6a6948e2798ea6c1ef830262
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
      - kselftest.proc.proc_proc-self-map-files-002
      last run: https://d.kernelci.org/test/maestro:6a6948e2798ea6c1ef830261
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
      - kselftest.timers
      last run: https://d.kernelci.org/test/maestro:6a691a48798ea6c1ef805dea
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.timers.timers_nanosleep
      last run: https://d.kernelci.org/test/maestro:6a694b39798ea6c1ef830887
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.timers.timers_nanosleep_CLOCK_REALTIME
      last run: https://d.kernelci.org/test/maestro:6a694b39798ea6c1ef830888
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: qcs8300-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.device-error-logs
      last run: https://d.kernelci.org/test/maestro:6a691a0e798ea6c1ef805bd4
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
Hardware: qcs9100-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:6a6919b9798ea6c1ef804d6d
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.arm64.arm64_fp-stress
      last run: https://d.kernelci.org/test/maestro:6a6940fc798ea6c1ef82e770
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
Hardware: qcs615-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:6a6919b5798ea6c1ef804af1
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.arm64.arm64_fp-stress
      last run: https://d.kernelci.org/test/maestro:6a692f5f798ea6c1ef822288
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.futex
      last run: https://d.kernelci.org/test/maestro:6a691a24798ea6c1ef805cb6
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.futex.futex_run_sh_global_requeue_multiple
      last run: https://d.kernelci.org/test/maestro:6a69389f798ea6c1ef8257c7
      history:  > ❌  > ✅  > ✅  > ✅  
            
Hardware: qcs6490-rb3gen2
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_reboot-mode
      last run: https://d.kernelci.org/test/maestro:6a692aa7798ea6c1ef8201c8
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_edp_aea0000
      last run: https://d.kernelci.org/test/maestro:6a692aa6798ea6c1ef8201a1
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_phy_aec2a00
      last run: https://d.kernelci.org/test/maestro:6a692aa6798ea6c1ef82019e
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_geniqup_9c0000_serial_99c000_bluetooth
      last run: https://d.kernelci.org/test/maestro:6a692aa6798ea6c1ef820180
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_phy_88e8000
      last run: https://d.kernelci.org/test/maestro:6a692aa6798ea6c1ef82015c
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_spmi_c440000_pmic_0_adc_3100
      last run: https://d.kernelci.org/test/maestro:6a692aa6798ea6c1ef820127
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_spmi_c440000_pmic_0_adc-tm_3400
      last run: https://d.kernelci.org/test/maestro:6a692aa6798ea6c1ef820128
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_spmi_c440000_pmic_0_nvram_7000
      last run: https://d.kernelci.org/test/maestro:6a692aa6798ea6c1ef820125
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_spmi_c440000_pmic_0_nvram_7100
      last run: https://d.kernelci.org/test/maestro:6a692aa6798ea6c1ef820124
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_spmi_c440000_pmic_0_nvram_7400
      last run: https://d.kernelci.org/test/maestro:6a692aa6798ea6c1ef820123
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_spmi_c440000_pmic_0_nvram_7c00
      last run: https://d.kernelci.org/test/maestro:6a692aa6798ea6c1ef820122
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_spmi_c440000_pmic_0_nvram_7d00
      last run: https://d.kernelci.org/test/maestro:6a692aa6798ea6c1ef820121
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_spmi_c440000_pmic_0_nvram_8400
      last run: https://d.kernelci.org/test/maestro:6a692aa6798ea6c1ef820120
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_spmi_c440000_pmic_0_nvram_8500
      last run: https://d.kernelci.org/test/maestro:6a692aa6798ea6c1ef82011f
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_spmi_c440000_pmic_0_nvram_8600
      last run: https://d.kernelci.org/test/maestro:6a692aa6798ea6c1ef82011e
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_spmi_c440000_pmic_0_nvram_9800
      last run: https://d.kernelci.org/test/maestro:6a692aa6798ea6c1ef82011d
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_spmi_c440000_pmic_0_nvram_9d00
      last run: https://d.kernelci.org/test/maestro:6a692aa6798ea6c1ef82011c
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_spmi_c440000_pmic_0_pon_1300
      last run: https://d.kernelci.org/test/maestro:6a692aa6798ea6c1ef82011b
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_spmi_c440000_pmic_0_pon_1300_pwrkey
      last run: https://d.kernelci.org/test/maestro:6a692aa6798ea6c1ef82011a
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_spmi_c440000_pmic_0_pon_1300_resin
      last run: https://d.kernelci.org/test/maestro:6a692aa6798ea6c1ef820119
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_spmi_c440000_pmic_0_rtc_6100
      last run: https://d.kernelci.org/test/maestro:6a692aa6798ea6c1ef820118
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_spmi_c440000_pmic_1_temp-alarm_a00
      last run: https://d.kernelci.org/test/maestro:6a692aa6798ea6c1ef820115
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_spmi_c440000_pmic_2_pwm
      last run: https://d.kernelci.org/test/maestro:6a692aa6798ea6c1ef820112
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_spmi_c440000_pmic_2_temp-alarm_a00
      last run: https://d.kernelci.org/test/maestro:6a692aa6798ea6c1ef820111
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_spmi_c440000_pmic_8_adc_3100
      last run: https://d.kernelci.org/test/maestro:6a692aa6798ea6c1ef82010f
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_spmi_c440000_pmic_8_temp-alarm_2400
      last run: https://d.kernelci.org/test/maestro:6a692aa6798ea6c1ef82010d
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_usb_a600000
      last run: https://d.kernelci.org/test/maestro:6a692aa6798ea6c1ef8200ec
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_video-codec_aa00000
      last run: https://d.kernelci.org/test/maestro:6a692aa6798ea6c1ef8200eb
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_wcn6750-pmu
      last run: https://d.kernelci.org/test/maestro:6a692aa6798ea6c1ef8200e6
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
Hardware: lemans-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.breakpoints
      last run: https://d.kernelci.org/test/maestro:6a6919cc798ea6c1ef805199
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.breakpoints.breakpoints_step_after_suspend_test
      last run: https://d.kernelci.org/test/maestro:6a6943f6798ea6c1ef82f2bc
      history:  > ❌  > ✅  
            
      - kselftest.device-error-logs
      last run: https://d.kernelci.org/test/maestro:6a691a08798ea6c1ef805bbd
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.futex
      last run: https://d.kernelci.org/test/maestro:6a691a2b798ea6c1ef805cd3
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.futex.futex_run_sh_global_requeue_multiple
      last run: https://d.kernelci.org/test/maestro:6a6947d0798ea6c1ef82fecb
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            


### UNSTABLE TESTS
    
Hardware: imx8mp-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.alsa.alsa_mixer-test_event_spurious_wm8960audio_59
      last run: https://d.kernelci.org/test/maestro:6a693215798ea6c1ef822e44
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.alsa.alsa_mixer-test_event_spurious_wm8960audio_62
      last run: https://d.kernelci.org/test/maestro:6a693215798ea6c1ef822e59
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.alsa.alsa_mixer-test_name_wm8960audio_61
      last run: https://d.kernelci.org/test/maestro:6a693215798ea6c1ef822e57
      history:  > ❌  > ✅  > ❌  > ❌  > ❌  
            
      - kselftest.alsa.alsa_mixer-test_name_wm8960audio_62
      last run: https://d.kernelci.org/test/maestro:6a693215798ea6c1ef822e5e
      history:  > ❌  > ✅  > ❌  > ❌  > ❌  
            
      - kselftest.alsa.alsa_mixer-test_name_wm8960audio_63
      last run: https://d.kernelci.org/test/maestro:6a693215798ea6c1ef822e65
      history:  > ❌  > ✅  > ❌  > ❌  > ❌  
            
      - kselftest.alsa.alsa_mixer-test_name_wm8960audio_64
      last run: https://d.kernelci.org/test/maestro:6a693215798ea6c1ef822e6c
      history:  > ❌  > ✅  > ❌  > ❌  > ❌  
            
      - kselftest.alsa.alsa_mixer-test_write_default_wm8960audio_70
      last run: https://d.kernelci.org/test/maestro:6a693215798ea6c1ef822e95
      history:  > ❌  > ✅  > ❌  > ❌  > ❌  
            
      - kselftest.alsa.alsa_mixer-test_write_default_wm8960audio_72
      last run: https://d.kernelci.org/test/maestro:6a693215798ea6c1ef822ea3
      history:  > ❌  > ✅  > ❌  > ❌  > ❌  
            
      - kselftest.alsa.alsa_mixer-test_write_invalid_wm8960audio_69
      last run: https://d.kernelci.org/test/maestro:6a693215798ea6c1ef822e8c
      history:  > ⚠️  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
      - kselftest.alsa.alsa_mixer-test_write_invalid_wm8960audio_70
      last run: https://d.kernelci.org/test/maestro:6a693215798ea6c1ef822e93
      history:  > ⚠️  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
      - kselftest.alsa.alsa_mixer-test_write_invalid_wm8960audio_71
      last run: https://d.kernelci.org/test/maestro:6a693215798ea6c1ef822e9a
      history:  > ⚠️  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
      - kselftest.alsa.alsa_mixer-test_write_invalid_wm8960audio_72
      last run: https://d.kernelci.org/test/maestro:6a693215798ea6c1ef822ea1
      history:  > ⚠️  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
      - kselftest.alsa.alsa_mixer-test_write_valid_wm8960audio_69
      last run: https://d.kernelci.org/test/maestro:6a693215798ea6c1ef822e8d
      history:  > ⚠️  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
      - kselftest.alsa.alsa_mixer-test_write_valid_wm8960audio_70
      last run: https://d.kernelci.org/test/maestro:6a693215798ea6c1ef822e94
      history:  > ⚠️  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
      - kselftest.alsa.alsa_mixer-test_write_valid_wm8960audio_71
      last run: https://d.kernelci.org/test/maestro:6a693215798ea6c1ef822e9b
      history:  > ⚠️  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
      - kselftest.alsa.alsa_mixer-test_write_valid_wm8960audio_72
      last run: https://d.kernelci.org/test/maestro:6a693215798ea6c1ef822ea2
      history:  > ⚠️  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_sound-wm8960
      last run: https://d.kernelci.org/test/maestro:6a693eb7798ea6c1ef82934a
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
Hardware: imx8mp-verdin-nonwifi-dahlia
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_bus_30800000_i2c_30a50000_eeprom_50
      last run: https://d.kernelci.org/test/maestro:6a692d33798ea6c1ef821c12
      history:  > ✅  > ✅  > ❌  > ✅  
            
Hardware: qcs8300-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.clone3
      last run: https://d.kernelci.org/test/maestro:6a6919eb798ea6c1ef805801
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.coredump
      last run: https://d.kernelci.org/test/maestro:6a692af0798ea6c1ef82027c
      history:  > ❌  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_display-controller_ae01000
      last run: https://d.kernelci.org/test/maestro:6a692be5798ea6c1ef820d6a
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_displayport-controller_af54000
      last run: https://d.kernelci.org/test/maestro:6a692be5798ea6c1ef820d68
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_dsi_ae94000
      last run: https://d.kernelci.org/test/maestro:6a692be5798ea6c1ef820d66
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_ethernet_23040000_mdio_phy_8
      last run: https://d.kernelci.org/test/maestro:6a692be5798ea6c1ef820d5e
      history:  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_geniqup_ac0000_i2c_a80000_i2c-mux_70_i2c_0_bridge_58
      last run: https://d.kernelci.org/test/maestro:6a692be5798ea6c1ef820d3d
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_pci_1c00000
      last run: https://d.kernelci.org/test/maestro:6a692be5798ea6c1ef820d24
      history:  > ✅  > ❌  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_usb_a600000
      last run: https://d.kernelci.org/test/maestro:6a692be5798ea6c1ef820cae
      history:  > ✅  > ❌  > ✅  > ✅  
            
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.ring-buffer
      last run: https://d.kernelci.org/test/maestro:6a690a71798ea6c1ef7f9893
      history:  > ❌  > ✅  > ❌  > ❌  > ❌  
            
Hardware: qcs9100-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.devices-probe
      last run: https://d.kernelci.org/test/maestro:6a691a84798ea6c1ef8087ee
      history:  > ❌  > ❌  > ❌  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_reboot-mode
      last run: https://d.kernelci.org/test/maestro:6a694740798ea6c1ef82fd11
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_clock-controller_abf0000
      last run: https://d.kernelci.org/test/maestro:6a694740798ea6c1ef82fd05
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_clock-controller_ade0000
      last run: https://d.kernelci.org/test/maestro:6a694740798ea6c1ef82fd04
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_clock-controller_af00000
      last run: https://d.kernelci.org/test/maestro:6a694740798ea6c1ef82fd03
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_cti_4b13000
      last run: https://d.kernelci.org/test/maestro:6a694740798ea6c1ef82fcfe
      history:  > ✅  > ✅  > ✅  > ⚠️  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_22000000
      last run: https://d.kernelci.org/test/maestro:6a694740798ea6c1ef82fcfd
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_22000000_displayport-controller_22154000
      last run: https://d.kernelci.org/test/maestro:6a694740798ea6c1ef82fcfb
      history:  > ✅  > ❌  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_22000000_displayport-controller_2215c000
      last run: https://d.kernelci.org/test/maestro:6a694740798ea6c1ef82fcfa
      history:  > ✅  > ❌  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_22000000_phy_220c2a00
      last run: https://d.kernelci.org/test/maestro:6a694740798ea6c1ef82fcf9
      history:  > ✅  > ❌  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_22000000_phy_220c5a00
      last run: https://d.kernelci.org/test/maestro:6a694740798ea6c1ef82fcf8
      history:  > ✅  > ❌  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_displayport-controller_af54000
      last run: https://d.kernelci.org/test/maestro:6a694740798ea6c1ef82fcf4
      history:  > ✅  > ❌  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_displayport-controller_af5c000
      last run: https://d.kernelci.org/test/maestro:6a694740798ea6c1ef82fcf2
      history:  > ✅  > ❌  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_phy_aec2a00
      last run: https://d.kernelci.org/test/maestro:6a694740798ea6c1ef82fcec
      history:  > ✅  > ❌  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_phy_aec5a00
      last run: https://d.kernelci.org/test/maestro:6a694740798ea6c1ef82fceb
      history:  > ✅  > ❌  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_ethernet_23000000
      last run: https://d.kernelci.org/test/maestro:6a694740798ea6c1ef82fce8
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_ethernet_23040000
      last run: https://d.kernelci.org/test/maestro:6a694740798ea6c1ef82fce7
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_ethernet_23040000_mdio_phy_8
      last run: https://d.kernelci.org/test/maestro:6a694740798ea6c1ef82fce5
      history:  > ✅  > ✅  > ✅  > ⚠️  > ⚠️  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_ethernet_23040000_mdio_phy_a
      last run: https://d.kernelci.org/test/maestro:6a694740798ea6c1ef82fce4
      history:  > ✅  > ✅  > ✅  > ⚠️  > ⚠️  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_funnel_4041000
      last run: https://d.kernelci.org/test/maestro:6a694740798ea6c1ef82fcdb
      history:  > ✅  > ✅  > ✅  > ⚠️  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_funnel_4042000
      last run: https://d.kernelci.org/test/maestro:6a694740798ea6c1ef82fcda
      history:  > ✅  > ✅  > ✅  > ⚠️  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_funnel_4045000
      last run: https://d.kernelci.org/test/maestro:6a694740798ea6c1ef82fcd9
      history:  > ✅  > ✅  > ✅  > ⚠️  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_funnel_4ad4000
      last run: https://d.kernelci.org/test/maestro:6a694740798ea6c1ef82fcd8
      history:  > ✅  > ✅  > ✅  > ⚠️  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_funnel_4b04000
      last run: https://d.kernelci.org/test/maestro:6a694740798ea6c1ef82fcd7
      history:  > ✅  > ✅  > ✅  > ⚠️  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_funnel_4b83000
      last run: https://d.kernelci.org/test/maestro:6a694740798ea6c1ef82fcd6
      history:  > ✅  > ✅  > ✅  > ⚠️  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_funnel_6800000
      last run: https://d.kernelci.org/test/maestro:6a694740798ea6c1ef82fcd5
      history:  > ✅  > ✅  > ✅  > ⚠️  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_funnel_6810000
      last run: https://d.kernelci.org/test/maestro:6a694740798ea6c1ef82fcd4
      history:  > ✅  > ✅  > ✅  > ⚠️  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_geniqup_8c0000_i2c_890000
      last run: https://d.kernelci.org/test/maestro:6a694740798ea6c1ef82fcd2
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_geniqup_8c0000_i2c_890000_gpio_74
      last run: https://d.kernelci.org/test/maestro:6a694740798ea6c1ef82fcd1
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_geniqup_8c0000_i2c_890000_i2c-mux_70
      last run: https://d.kernelci.org/test/maestro:6a694740798ea6c1ef82fcd0
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_geniqup_ac0000_i2c_a90000
      last run: https://d.kernelci.org/test/maestro:6a694740798ea6c1ef82fcc9
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_gpu_3d00000
      last run: https://d.kernelci.org/test/maestro:6a694740798ea6c1ef82fcc4
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_pcie_1c00000_pcie_0_wifi_0
      last run: https://d.kernelci.org/test/maestro:6a694740798ea6c1ef82fcab
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_remoteproc_20c00000
      last run: https://d.kernelci.org/test/maestro:6a694740798ea6c1ef82fc97
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_remoteproc_21c00000
      last run: https://d.kernelci.org/test/maestro:6a694740798ea6c1ef82fc92
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_remoteproc_26300000
      last run: https://d.kernelci.org/test/maestro:6a694740798ea6c1ef82fc8d
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_remoteproc_2a300000
      last run: https://d.kernelci.org/test/maestro:6a694740798ea6c1ef82fc81
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_remoteproc_30000000
      last run: https://d.kernelci.org/test/maestro:6a694740798ea6c1ef82fc72
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_replicator_4046000
      last run: https://d.kernelci.org/test/maestro:6a694740798ea6c1ef82fc68
      history:  > ✅  > ✅  > ✅  > ⚠️  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_replicator_404e000
      last run: https://d.kernelci.org/test/maestro:6a694740798ea6c1ef82fc67
      history:  > ✅  > ✅  > ✅  > ⚠️  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_replicator_4b06000
      last run: https://d.kernelci.org/test/maestro:6a694740798ea6c1ef82fc66
      history:  > ✅  > ✅  > ✅  > ⚠️  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_spmi_c440000_pmic_0_nvram_7100
      last run: https://d.kernelci.org/test/maestro:6a694740798ea6c1ef82fc59
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_spmi_c440000_pmic_0_pon_1200
      last run: https://d.kernelci.org/test/maestro:6a694740798ea6c1ef82fc58
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_spmi_c440000_pmic_0_pon_1200_pwrkey
      last run: https://d.kernelci.org/test/maestro:6a694740798ea6c1ef82fc57
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_spmi_c440000_pmic_0_pon_1200_resin
      last run: https://d.kernelci.org/test/maestro:6a694740798ea6c1ef82fc56
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_spmi_c440000_pmic_0_rtc_6100
      last run: https://d.kernelci.org/test/maestro:6a694740798ea6c1ef82fc55
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_spmi_c440000_pmic_0_temp-alarm_a00
      last run: https://d.kernelci.org/test/maestro:6a694740798ea6c1ef82fc54
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_spmi_c440000_pmic_2_temp-alarm_a00
      last run: https://d.kernelci.org/test/maestro:6a694740798ea6c1ef82fc51
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_spmi_c440000_pmic_4_temp-alarm_a00
      last run: https://d.kernelci.org/test/maestro:6a694740798ea6c1ef82fc4e
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_spmi_c440000_pmic_6_temp-alarm_a00
      last run: https://d.kernelci.org/test/maestro:6a694740798ea6c1ef82fc4b
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_sram_c3f0000
      last run: https://d.kernelci.org/test/maestro:6a694740798ea6c1ef82fc48
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_stm_4002000
      last run: https://d.kernelci.org/test/maestro:6a694740798ea6c1ef82fc47
      history:  > ✅  > ✅  > ✅  > ⚠️  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_system-cache-controller_9200000
      last run: https://d.kernelci.org/test/maestro:6a694740798ea6c1ef82fc45
      history:  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_tmc_4048000
      last run: https://d.kernelci.org/test/maestro:6a694740798ea6c1ef82fc3f
      history:  > ✅  > ✅  > ✅  > ⚠️  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_tmc_404f000
      last run: https://d.kernelci.org/test/maestro:6a694740798ea6c1ef82fc3e
      history:  > ✅  > ✅  > ✅  > ⚠️  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_tmc_4b05000
      last run: https://d.kernelci.org/test/maestro:6a694740798ea6c1ef82fc3d
      history:  > ✅  > ✅  > ✅  > ⚠️  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_wcn6855-pmu
      last run: https://d.kernelci.org/test/maestro:6a694740798ea6c1ef82fc1d
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.exec
      last run: https://d.kernelci.org/test/maestro:6a691aa3798ea6c1ef808dde
      history:  > ❌  > ❌  > ❌  > ✅  > ❌  
            
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.efivars
      last run: https://d.kernelci.org/test/maestro:6a690a29798ea6c1ef7f9544
      history:  > ❌  > ✅  > ❌  > ❌  > ❌  
            
      - kselftest.ring-buffer
      last run: https://d.kernelci.org/test/maestro:6a690a72798ea6c1ef7f9896
      history:  > ❌  > ✅  > ❌  > ❌  > ❌  
            
Hardware: kaanapali-mtp
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:6a6919bb798ea6c1ef805082
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.arm64.arm64_fp-stress
      last run: https://d.kernelci.org/test/maestro:6a6923cd798ea6c1ef8144b7
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
Hardware: qcs615-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.breakpoints
      last run: https://d.kernelci.org/test/maestro:6a6919c5798ea6c1ef8050f9
      history:  > ❌  > ✅  > ❌  > ❌  > ❌  
            
      - kselftest.breakpoints.breakpoints_step_after_suspend_test
      last run: https://d.kernelci.org/test/maestro:6a6930ae798ea6c1ef8227e4
      history:  > ❌  > ✅  > ❌  > ❌  > ❌  
            
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.efivars
      last run: https://d.kernelci.org/test/maestro:6a690a26798ea6c1ef7f9530
      history:  > ❌  > ❌  > ❌  > ✅  > ❌  
            
      - kselftest.ring-buffer
      last run: https://d.kernelci.org/test/maestro:6a690a6e798ea6c1ef7f9887
      history:  > ❌  > ❌  > ✅  > ❌  
            
Hardware: qcs6490-rb3gen2
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.gpio
      last run: https://d.kernelci.org/test/maestro:6a690a44798ea6c1ef7f968a
      history:  > ❌  > ❌  > ❌  > ✅  > ❌  
            
Hardware: lemans-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.devices-exist
      last run: https://d.kernelci.org/test/maestro:6a691a6f798ea6c1ef806bc3
      history:  > ❌  > ❌  > ✅  > ❌  > ❌  
            
      - kselftest.devices-probe
      last run: https://d.kernelci.org/test/maestro:6a694d8b798ea6c1ef833d31
      history:  > ❌  > ❌  > ❌  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_phy_aec5a00
      last run: https://d.kernelci.org/test/maestro:6a6947e3798ea6c1ef82ffcb
      history:  > ✅  > ❌  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_ethernet_23040000
      last run: https://d.kernelci.org/test/maestro:6a6947e3798ea6c1ef82ffc5
      history:  > ✅  > ❌  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_ethernet_23040000_mdio_ethernet-phy_1c
      last run: https://d.kernelci.org/test/maestro:6a6947e3798ea6c1ef82ffc3
      history:  > ✅  > ⚠️  > ✅  > ⚠️  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_geniqup_8c0000_i2c_890000_eeprom_50
      last run: https://d.kernelci.org/test/maestro:6a6947e3798ea6c1ef82ffb0
      history:  > ✅  > ❌  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_geniqup_8c0000_i2c_890000_eeprom_50_nvmem-layout
      last run: https://d.kernelci.org/test/maestro:6a6947e3798ea6c1ef82ffaf
      history:  > ✅  > ❌  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_geniqup_8c0000_serial_88c000_bluetooth
      last run: https://d.kernelci.org/test/maestro:6a6947e3798ea6c1ef82ffa7
      history:  > ✅  > ❌  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_geniqup_8c0000_spi_888000
      last run: https://d.kernelci.org/test/maestro:6a6947e3798ea6c1ef82ffa6
      history:  > ❌  > ❌  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_usb_a800000_hub_2
      last run: https://d.kernelci.org/test/maestro:6a6947e2798ea6c1ef82ff00
      history:  > ✅  > ✅  > ⚠️  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_video-codec_aa00000
      last run: https://d.kernelci.org/test/maestro:6a6947e2798ea6c1ef82feff
      history:  > ✅  > ❌  > ✅  > ❌  
            
      - kselftest.timers.timers_inconsistency-check_CLOCK_BOOTTIME_ALARM
      last run: https://d.kernelci.org/test/maestro:6a694b39798ea6c1ef830871
      history:  > ✅  > ✅  > ⚠️  > ✅  > ✅  
            
      - kselftest.timers.timers_inconsistency-check_CLOCK_REALTIME_ALARM
      last run: https://d.kernelci.org/test/maestro:6a694b39798ea6c1ef830872
      history:  > ✅  > ✅  > ⚠️  > ✅  > ✅  
            
      - kselftest.timers.timers_nsleep-lat_CLOCK_BOOTTIME_ALARM
      last run: https://d.kernelci.org/test/maestro:6a694b39798ea6c1ef83087f
      history:  > ✅  > ✅  > ⚠️  > ✅  > ✅  
            
      - kselftest.timers.timers_nsleep-lat_CLOCK_REALTIME_ALARM
      last run: https://d.kernelci.org/test/maestro:6a694b39798ea6c1ef830880
      history:  > ✅  > ✅  > ⚠️  > ✅  > ✅  
            



This branch has 1 pre-existing build issues. See details in the dashboard.

Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
