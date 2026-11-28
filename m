Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795833044;
	b=fa2tgAnvFLJo94k0mQYQZP1q7Oxx6KGD6RDBhSTztAf/ELIMjUkHDBS7Zp4nH3AFzyaA
	 dQKHrBF4u2ufnlGyV8HKWRcVwbT1QwQQO3Rrk6DVx47Y1QiWUe2skug+CmJm1jocMfz9D
	 6PpQn5QdZ83GCvu8xyvyeYZKNcTTu4PXt+Cohr91p2MVHI5U06/KlKA8MDZQxV9HZAg1j
	 GPqLqPKge82TP6fWZtlTusqiKeDxP3O3mxVRxlqKausRHYYq2BNpx/FYnmDkz7FVjSBWF
	 4ZWNUGbZzowo4PxYKF+0uWbntcdFXAdRr5L4JgKYZGqWpxSgLORDk3DFDOOGvqXEmzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795833044;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Content-Type:
	 MIME-Version:Content-Transfer-Encoding:Subject:From:To:Cc:Reply-To:
	 Date:Message-ID;
	bh=74RJYhBrRJuq1TZuuE7otz7V81+r5+YHTQruOliiQKY=;
	b=hwMjFZ8YbDe6I/lTokDtOHqf9uDQcsDX0T/veuoV32e5Bdei3TzVH5uxbdmxZLN/jw7x
	 VUSHFKJbpFqcMOHYxXHHA+nSqJUauNVx1i9mK8aRH8N4PHAxkEBMeScg2Vjd7sOHoht98
	 p25FETEvlc8IFSe/+B988BK5lk5DgHPb5Y1BDUZgSmm/B7pS+Vwl9NAOZsDHU2ma69UMA
	 pHEoyCIcsESPwFo1N0jF0vK5ydXG1QRF+4AzpQLrIIeSxBbC3Z8pBsONjrtGFCyJWdYD5
	 NGWhOfKgT5+KWW1wk0P3PMsvHWyAj21XzwM3o67IcJHcWdrTBgRm+VCsTuu2nnpx+6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernelci.org;
	spf=pass smtp.mailfrom=kernelci.org;
	dkim=pass header.d=kernelci.org header.i=@kernelci.org header.a=rsa-sha256 header.s=google header.b=SbFHZPdV;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67903606A31C
	for <linux-next@vger.kernel.org>; Sat, 28 Nov 2026 02:30:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67903606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernelci.org header.i=@kernelci.org header.a=rsa-sha256 header.s=google header.b=SbFHZPdV
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-3282db206d3so6977674eec.0
        for <linux-next@vger.kernel.org>; Fri, 27 Nov 2026 18:30:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1795833042; x=1796437842; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=74RJYhBrRJuq1TZuuE7otz7V81+r5+YHTQruOliiQKY=;
        b=SbFHZPdVUXAFxSbTfpRtw/3OE1cPPcW7Tep4aG5jmu4nwjkzd3/Oqj6HQzTKWOYTbi
         i1TZMByZYVbN1WfPNehW0gujMe23MLfe4efjeL7qkXK9+HwhmPXrJaCK76UFYzbmYyCR
         uVxPdMXsuqzq3ejXOer+I4XVuAa89SXyrophn0tTQaMibVlyVKsjdKgKVIvJYZ1dqSCd
         OtuqFOCgeKXTM7WU/byICpXj4Wxyjr6UKctE3i0KBQeSI5J/XSG3hqpiSQYjSysybJgf
         qdAnoHjx7DKBQGM3xSRPvfZUUupb68cAE04USLr84ph9hvwr+QVSk+7+ophd0FrWAGIp
         IRKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795833042; x=1796437842;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=74RJYhBrRJuq1TZuuE7otz7V81+r5+YHTQruOliiQKY=;
        b=F9oW8LF+79axmDe0teet8Kk7cSmG4vP3o8wnefjtzIGnEzK9xJRUpOsCVkBYUMdjTo
         2adnS6N31aTGQyAhAb0/vyvKpcT6lbV3+iLgEnnXXc0e9Gz2sFufWCqqIEdNtq8iGFYk
         ScXaM+ItQQq0VJOmEuudbYhcCrzlvluOE63enh4sGhrSklaiD/EoJXfkkYRcQSOFo5Zt
         mmtznP2m0JTtuuh6enUH5yXWHvNFF+LK+0zR7NvBnz7nf1KMonoGSj9uvefMkUJs3rij
         GDiEg4J7QTirX7MPPHrzQJvzJ3dFW6fBhKVZ4Vj4aUB0gyRSg532bH9+yK2UpJ+pTuPh
         WJbg==
X-Gm-Message-State: APuU4Z9k9HzjtwqxnYrnGY9SUJwnG+yd4Rq5f0hJGOKGN6atH2qcHfaC
	p0b+4CIzcdphx+ZkBzTgoiArNBycbO39lrYcbU0Kv2XgAmuP6UXVPdobwEJeGjj6vU8efuxfMql
	eGiKK
X-Gm-Gg: AZFdTZeFtHjouoRQq8qfOno58RPYtoX5lzUouETe+hqfT9O85BCYAvJwkgdaCXsTdc5
	awHoZkKtIEIc7e6DVnr5zfGI0AWLRlNSRSd63+5Dq32DqxFosxj5HAqrky8PfOFI/o7fEhOvniH
	etKCxjwMy+1lufJMRkDeYyC1lUX03kAXvq8NZEyTbz0foqOdgxbfnW6vOpcixi5VcTtaEOYRvy/
	zk6u0gAGd8EzP6vgcN32zbbCPbvBGudFc4Fj7hpEjKPh7RN2Rn2nHwfhPWrF91qcDLIXtz1MOl3
	NonQWhyNdcEgqIouS4AEpXwNMGuZytiVzjyOwi8Ud5PeMypCSoEuW88bVlg22kxWzyU2C8rMN2X
	iZJNm8zPOL/tlfhic93sWr4X1UTEEU5Fuk+pb0wVcf+W75qf8drsiDbbMri9l5RN1OnxJ1M86uv
	taEOrT1LdnvMH2UT1kMxNCegd3RfcU+Bd3KqrEC5nl+nuWke6KSypKPuRat9KpWEyEsosK6/m2/
	cZYVNVNKsdEGNPeSRP+wk3S30qwqvx/CGR/is+SGk5SHS/GvIHWStlg1JBeAEbXfwehm2GCZb5B
	gGmoaHM2pn3uhhmzJ+QPaQ==
X-Received: by 2002:a05:7300:f498:b0:386:a716:916b with SMTP id 5a478bee46e88-386a7169544mr20226008eec.31.1795833042368;
        Fri, 27 Nov 2026 18:30:42 -0800 (PST)
Received: from 52d83ede7c60 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672c6f31sm75205835eec.15.2026.11.27.18.30.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 18:30:41 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Post: <mailto:linux-next@vger.kernel.org>
List-Help: <mailto:linux-next+help@vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-next+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - e5aad2bdbbee783611d32599f89cea3f12f9593d
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Sat, 28 Nov 2026 02:30:41 -0000
Message-ID: <179583304157.235983.12672168945201314642@52d83ede7c60>



Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/e5aad2bdbbee783611d32599f89cea3f12f9593d/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: e5aad2bdbbee783611d32599f89cea3f12f9593d
origin: maestro
test start time: 2026-11-27 16:50:26.339000+00:00

Builds:	   66 ✅    4 ❌    0 ⚠️
Boots: 	  194 ✅   20 ❌    0 ⚠️
Tests: 	38844 ✅ 2251 ❌ 5510 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: hamoa-crd
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.devices-probe
      last run: https://d.kernelci.org/test/maestro:6b09cfc2286e1965ecceb759
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
Hardware: purwa-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.coredump
      last run: https://d.kernelci.org/test/maestro:6b09cf45286e1965ecceb1d3
      history:  > ✅  > ❌  > ❌  
            
      - kselftest.device-error-logs
      last run: https://d.kernelci.org/test/maestro:6b09cf4f286e1965ecceb1ff
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_pcie_1bd0000
      last run: https://d.kernelci.org/test/maestro:6b09d7b0286e1965eccf5d30
      history:  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_pcie_1bd0000_pcie_0
      last run: https://d.kernelci.org/test/maestro:6b09d7b0286e1965eccf5d2e
      history:  > ✅  > ❌  > ❌  
            
      - kselftest.proc
      last run: https://d.kernelci.org/test/maestro:6b09cf84286e1965ecceb574
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.proc.proc_proc-readdir-churn
      last run: https://d.kernelci.org/test/maestro:6b09d9b5286e1965eccf6c74
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.proc.proc_proc-readdir-churn_proc_readdir_remove_current
      last run: https://d.kernelci.org/test/maestro:6b09d9b5286e1965eccf6c75
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.proc.proc_proc-remove-slow-sysctl
      last run: https://d.kernelci.org/test/maestro:6b09d9b5286e1965eccf6c51
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.proc.proc_proc-remove-slow-sysctl_proc_sys_slow_write
      last run: https://d.kernelci.org/test/maestro:6b09d9b5286e1965eccf6c53
      history:  > ✅  > ✅  > ❌  
            
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.efivars
      last run: https://d.kernelci.org/test/maestro:6b09d693286e1965eccf4f2f
      history:  > ✅  > ❌  > ❌  
            
      - kselftest.gpio.gpio_gpio-aggregator_sh
      last run: https://d.kernelci.org/test/maestro:6b09e1f0286e1965eccfe8bb
      history:  > ✅  > ✅  > ❌  
            
Hardware: qcs615-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.timers
      last run: https://d.kernelci.org/test/maestro:6b09fc7c286e1965ecd1d3c5
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.timers.timers_rtcpie
      last run: https://d.kernelci.org/test/maestro:6b09fc7c286e1965ecd1d3c6
      history:  > ✅  > ✅  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: purwa-evk
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.ring-buffer
      last run: https://d.kernelci.org/test/maestro:6b09d6ce286e1965eccf52c5
      history:  > ❌  > ❌  > ✅  
            


### UNSTABLE TESTS
    
Hardware: glymur-crd
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_pcie_1bf0000
      last run: https://d.kernelci.org/test/maestro:6b09d484286e1965eccee880
      history:  > ❌  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_pcie_1bf0000_pcie_0
      last run: https://d.kernelci.org/test/maestro:6b09d484286e1965eccee87e
      history:  > ❌  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_pcie_1bf0000_pcie_0_wifi_0
      last run: https://d.kernelci.org/test/maestro:6b09d484286e1965eccee87d
      history:  > ❌  > ✅  > ✅  > ❌  
            
Hardware: hamoa-crd
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.ftrace.ftrace_ftracetest-ktap_event_trigger___test_poll_wait_on_histogram
      last run: https://d.kernelci.org/test/maestro:6b09e1d6286e1965eccfe66c
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
Hardware: lemans-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.devices-probe
      last run: https://d.kernelci.org/test/maestro:6b09cfc7286e1965ecceb837
      history:  > ❌  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_usb_a800000_hub_2
      last run: https://d.kernelci.org/test/maestro:6b09fdd3286e1965ecd1e60b
      history:  > ⚠️  > ✅  > ✅  
            
      - kselftest.proc
      last run: https://d.kernelci.org/test/maestro:6b09cf82286e1965ecceb56a
      history:  > ✅  > ❌  > ✅  
            
Hardware: purwa-crd
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.timers
      last run: https://d.kernelci.org/test/maestro:6b09cf88286e1965ecceb5a3
      history:  > ❌  > ✅  > ❌  > ❌  
            
      - kselftest.timers.timers_rtcpie
      last run: https://d.kernelci.org/test/maestro:6b09da68286e1965eccf6ffb
      history:  > ❌  > ✅  > ❌  > ❌  
            
Hardware: purwa-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.devices-probe
      last run: https://d.kernelci.org/test/maestro:6b09cfc8286e1965ecceb840
      history:  > ❌  > ✅  > ❌  
            
Hardware: qcs615-ride
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.ring-buffer
      last run: https://d.kernelci.org/test/maestro:6b09d6c6286e1965eccf5289
      history:  > ✅  > ❌  > ✅  
            
Hardware: qcs6490-rb3gen2
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_iommu_3da0000
      last run: https://d.kernelci.org/test/maestro:6b09d8ae286e1965eccf6640
      history:  > ✅  > ❌  > ✅  
            
Hardware: qemu-arm64
  > Config: defconfig+netdev+nfs-root-boot+ltp+crypto+ima
    - Architecture/compiler: arm64/gcc-15
      - ltp
      last run: https://d.kernelci.org/test/maestro:6b09d848286e1965eccf63a0
      history:  > ✅  > ✅  > ❌  > ✅  > ❌  
            



This branch has 3 pre-existing build issues. See details in the dashboard.

Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
