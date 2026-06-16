Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 335FD3CBE88
	for <linux-next@vger.kernel.org>; Tue, 16 Jun 2026 02:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781577042; cv=none; b=LbXEuWDpwxIO9amBxXZaHSudVwP+inft3Zxh1Xj7CfnL1kVR2UsKuZosxMpufb8Wze5RhKcYwkW6wmzlGc0F+K/tnM/Mq92WlIErjBsOn//QDlRgaNn3AVGgvDaWifjG5YTqowrPfcdqSu+bQ+OuDt9orpxBupv1m0N4YEf/CFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781577042; c=relaxed/simple;
	bh=ZQMJUO+zPYCcDnxVXv8pvyH4bsjcwMJEtykuDH/svr0=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=m+HefVgak4hplcLaCKttgb6M/WXJxuPgtQDVK3sLKNLr9eRPkLxjjxba+IBw+oWJqHux4XqWCe3aR67VSt6FbDK9XZfhhefGM551UIPjPLyX4w2AUCy8Odg+ipFLrYNRGs9B13YXpWaOwNSdbpjGBlHoHLS9rU5cbzUy4MXiJT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=HBZJpyM7; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="HBZJpyM7"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-304ec41197bso4515044eec.1
        for <linux-next@vger.kernel.org>; Mon, 15 Jun 2026 19:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1781577036; x=1782181836; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bt05KBH4yfxc14QyQiG/9wB3YFXQTBVAEyheYnXwZh4=;
        b=HBZJpyM7WsCVbsJCObJidUIWYSbuifZ/xCRVLkp5XZAvDLw9N48CTl0fIQv2/OKLLt
         uDtrfPetoJMXiCcnFvyVNTiwhBnNXZXSjWJGF2X1QC77Q/tIufquZbtLiT8jmQQ4IcMl
         n+E5uWwlG0H8WYZnW3R8UEpbIWwFImhpzadYbQinCywZlfC86krWjUht5fk6/z9l4WEG
         7opdBg7RU2JZQYpIQeLsFR3oD374y30+wUFy+nZJ/s/8M5Nota/570k5V38otGfuIQcu
         1cY43c5C3eRdLNdvnlg8xlL/8znmFPfxUksWJkbB+1H+g3wsJwY6NgbQnXN7qR1DgF00
         yByA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781577036; x=1782181836;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bt05KBH4yfxc14QyQiG/9wB3YFXQTBVAEyheYnXwZh4=;
        b=YVH6TBNQzxzBLXkUWFxgs0qfkDOUsZdworbiy1QP+/8e7lchs0ysEYTOeE7s/kTHoY
         T6oI7tt6hOrw/mX8lffxxjA/bl2ddkQ07xJ6KvKf71cVmjKaBOnplwnnqFGUAb3IxFBq
         SI8pvr45VIwAGESh1GGW4a7p8zhjsfXUciE9iNhP+eMTO3j0a1BVcX+jvWMw7RHmpOr+
         vxuiR5tqO3rZ2L3piTrHFutJ1SZy50pUnnrwaljOV5IcFbOuAo3kaKeiQLYFLeOst3YY
         TP41XR86x9qaQ0hZ8Q3cIWSVe6CfVOtw0qYZjmkzyaAoP84ZrE8AkQm/FRbhPXWULGMn
         KJ3A==
X-Gm-Message-State: AOJu0YyBNUqXH6s+wdncvCDGTSyDFUSDJP8Idp/Ijfb4wpbpmHR803+S
	NtnqkR8QIWnU8VUFjJHNZWWrru6exMjsMiCcT5I+K38i3QEthXMiooqX3QxaTMAT0VbIIorBx72
	ZMQMp
X-Gm-Gg: Acq92OEfoY1htHwLMnIKA2dA1QUNmqICID5GGJ3Dgz9rBhCiojoXvn5Rqo05rPEf2/S
	vIZ07M2PXC8SieliqZt6FnB2SI6NQ3cHpWdaMzXxNTEE5WLnm6qZzU2rPGsmwZI289rhQcFnfxY
	S0ifuuEvnsF83nJs6Cezom3TbmYcJhrrIw+uoQDWKMfRGFiEeFwoS6GRSW9OVEMhvrtKsuNFbCe
	EHztcclvMvTnFueNk4prieUU5DTYcpUF8N/BQydnklNNajUGTaXA/H4qKn8PPd2R/hpzR6jr21t
	2YRFJyvluKzJIiuagvbTY3mMiYTtCUkIUvCrabzSNr4aNIcwRLNMGHSi2pUVSWk4hk1CLAUqNNz
	8ey2Kp2pEl9EPZWY0njWWGSJn1EqkINwudvYQg1dJzzX8wgl6MXJ7dB0ST5COzSs2unizeArnLY
	32z6hh4nLWsERTgtHS
X-Received: by 2002:a05:7300:d11:b0:2f5:285c:4374 with SMTP id 5a478bee46e88-30ba604484dmr1198635eec.35.1781577035911;
        Mon, 15 Jun 2026 19:30:35 -0700 (PDT)
Received: from 330cfa3079ca ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081ea4f7a0sm15642758eec.24.2026.06.15.19.30.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 19:30:35 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - 8d6dbbbe3ba62de0a63e962ee004afb848c8e3ac
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Tue, 16 Jun 2026 02:30:35 -0000
Message-ID: <178157703506.15486.7015362265068126861@330cfa3079ca>





Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/8d6dbbbe3ba62de0a63e962ee004afb848c8e3ac/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 8d6dbbbe3ba62de0a63e962ee004afb848c8e3ac
origin: maestro
test start time: 2026-06-15 16:32:00.683000+00:00

Builds:	   58 ✅    1 ❌    0 ⚠️
Boots: 	  168 ✅    3 ❌    5 ⚠️
Tests: 	29239 ✅ 4933 ❌ 6587 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: glymur-crd
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.timers
      last run: https://d.kernelci.org/test/maestro:6a30482da1ade4ad5d1250f0
      history:  > ✅  > ❌  > ❌  > ❌  
            
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.gpio
      last run: https://d.kernelci.org/test/maestro:6a30377ca1ade4ad5d11aafa
      history:  > ✅  > ✅  > ❌  > ❌  > ❌  
            
Hardware: kaanapali-mtp
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.timers
      last run: https://d.kernelci.org/test/maestro:6a303bc2a1ade4ad5d11bccd
      history:  > ✅  > ✅  > ❌  > ❌  > ❌  
            
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.gpio
      last run: https://d.kernelci.org/test/maestro:6a303783a1ade4ad5d11ab21
      history:  > ✅  > ✅  > ❌  > ❌  > ❌  
            
Hardware: qcs615-ride
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.gpio
      last run: https://d.kernelci.org/test/maestro:6a30377ea1ade4ad5d11ab05
      history:  > ✅  > ✅  > ❌  > ❌  
            
Hardware: qcs8300-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:6a303b75a1ade4ad5d11ba9a
      history:  > ✅  > ✅  > ❌  > ❌  > ❌  
            
      - kselftest.timers
      last run: https://d.kernelci.org/test/maestro:6a303bbfa1ade4ad5d11bcc2
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.timers.timers_rtcpie
      last run: https://d.kernelci.org/test/maestro:6a304689a1ade4ad5d124fb7
      history:  > ✅  > ✅  > ❌  
            
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.gpio
      last run: https://d.kernelci.org/test/maestro:6a303780a1ade4ad5d11ab0e
      history:  > ✅  > ✅  > ❌  > ❌  > ❌  
            
Hardware: x1e80100
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.timers
      last run: https://d.kernelci.org/test/maestro:6a303bc5a1ade4ad5d11bcdc
      history:  > ✅  > ✅  > ❌  > ❌  > ❌  
            
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.gpio
      last run: https://d.kernelci.org/test/maestro:6a303786a1ade4ad5d11ab2e
      history:  > ✅  > ✅  > ❌  > ❌  > ❌  
            
Hardware: bcm2711-rpi-4-b
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.device_error_logs
      last run: https://d.kernelci.org/test/maestro:6a303bdda1ade4ad5d11bd82
      history:  > ✅  > ❌  > ❌  
            
      - kselftest.device_error_logs.devices_error_logs_test_device_error_logs_py
      last run: https://d.kernelci.org/test/maestro:6a304723a1ade4ad5d125098
      history:  > ✅  > ❌  > ❌  
            
      - kselftest.dt
      last run: https://d.kernelci.org/test/maestro:6a303bf8a1ade4ad5d11be37
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh
      last run: https://d.kernelci.org/test/maestro:6a304a4fa1ade4ad5d12526b
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_gpu
      last run: https://d.kernelci.org/test/maestro:6a304a4fa1ade4ad5d1252b1
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
Hardware: bcm2837-rpi-3-b-plus
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_gpu
      last run: https://d.kernelci.org/test/maestro:6a304503a1ade4ad5d121f08
      history:  > ✅  > ❌  > ❌  
            
Hardware: sm8750-mtp
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.timers
      last run: https://d.kernelci.org/test/maestro:6a303bc1a1ade4ad5d11bcc8
      history:  > ✅  > ✅  > ❌  > ❌  > ❌  
            
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.gpio
      last run: https://d.kernelci.org/test/maestro:6a303782a1ade4ad5d11ab1c
      history:  > ✅  > ✅  > ❌  > ❌  > ❌  
            
Hardware: qcs6490-rb3gen2
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.breakpoints
      last run: https://d.kernelci.org/test/maestro:6a303b7fa1ade4ad5d11bada
      history:  > ✅  > ❌  > ❌  
            
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.gpio
      last run: https://d.kernelci.org/test/maestro:6a30377fa1ade4ad5d11ab09
      history:  > ✅  > ✅  > ❌  > ❌  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: kaanapali-mtp
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.coredump
      last run: https://d.kernelci.org/test/maestro:6a303ba3a1ade4ad5d11bbdb
      history:  > ❌  > ❌  > ✅  
            
Hardware: asus-CX3402CVA-brya
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kernelci_sleep
      last run: https://d.kernelci.org/test/maestro:6a30353ba1ade4ad5d11734c
      history:  > ❌  > ✅  > ✅  
            
      - kernelci_sleep.rtcwake-freeze-1
      last run: https://d.kernelci.org/test/maestro:6a30367ca1ade4ad5d119709
      history:  > ❌  > ✅  > ✅  
            
      - kernelci_sleep.rtcwake-freeze-10
      last run: https://d.kernelci.org/test/maestro:6a30367ca1ade4ad5d119700
      history:  > ❌  > ✅  > ✅  
            
      - kernelci_sleep.rtcwake-freeze-3
      last run: https://d.kernelci.org/test/maestro:6a30367ca1ade4ad5d119703
      history:  > ❌  > ✅  > ✅  
            
      - kernelci_sleep.rtcwake-freeze-4
      last run: https://d.kernelci.org/test/maestro:6a30367ca1ade4ad5d119702
      history:  > ❌  > ✅  > ✅  
            
      - kernelci_sleep.rtcwake-freeze-5
      last run: https://d.kernelci.org/test/maestro:6a30367ca1ade4ad5d119701
      history:  > ❌  > ✅  > ✅  
            
      - kernelci_sleep.rtcwake-freeze-6
      last run: https://d.kernelci.org/test/maestro:6a30367ca1ade4ad5d119704
      history:  > ❌  > ✅  > ✅  
            
      - kernelci_sleep.rtcwake-freeze-7
      last run: https://d.kernelci.org/test/maestro:6a30367ca1ade4ad5d119706
      history:  > ❌  > ✅  > ✅  
            
      - kernelci_sleep.rtcwake-freeze-8
      last run: https://d.kernelci.org/test/maestro:6a30367ca1ade4ad5d119705
      history:  > ❌  > ✅  > ✅  
            
      - kernelci_sleep.rtcwake-freeze-9
      last run: https://d.kernelci.org/test/maestro:6a30367ca1ade4ad5d1196ff
      history:  > ❌  > ✅  > ✅  
            
      - kernelci_sleep.rtcwake-mem-1
      last run: https://d.kernelci.org/test/maestro:6a30367ca1ade4ad5d119713
      history:  > ❌  > ✅  > ✅  
            
      - kernelci_sleep.rtcwake-mem-10
      last run: https://d.kernelci.org/test/maestro:6a30367ca1ade4ad5d119707
      history:  > ❌  > ✅  > ✅  
            
      - kernelci_sleep.rtcwake-mem-3
      last run: https://d.kernelci.org/test/maestro:6a30367ca1ade4ad5d119710
      history:  > ❌  > ✅  > ✅  
            
      - kernelci_sleep.rtcwake-mem-4
      last run: https://d.kernelci.org/test/maestro:6a30367ca1ade4ad5d11970c
      history:  > ❌  > ✅  > ✅  
            
      - kernelci_sleep.rtcwake-mem-6
      last run: https://d.kernelci.org/test/maestro:6a30367ca1ade4ad5d11970e
      history:  > ❌  > ✅  > ✅  
            
      - kernelci_sleep.rtcwake-mem-8
      last run: https://d.kernelci.org/test/maestro:6a30367ca1ade4ad5d11970b
      history:  > ❌  > ✅  > ✅  
            
      - kernelci_sleep.rtcwake-mem-9
      last run: https://d.kernelci.org/test/maestro:6a30367ca1ade4ad5d11970a
      history:  > ❌  > ✅  > ✅  
            


### UNSTABLE TESTS
    
Hardware: bcm2711-rpi-4-b
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - boot
      last run: https://d.kernelci.org/test/maestro:6a303bafa1ade4ad5d11bc60
      history:  > ✅  > ✅  > ⚠️  > ✅  > ✅  
            
Hardware: beaglebone-black
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - boot
      last run: https://d.kernelci.org/test/maestro:6a302e66a1ade4ad5d10f970
      history:  > ⚠️  > ✅  > ✅  > ⚠️  > ✅  
            
Hardware: imx6dl-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - boot
      last run: https://d.kernelci.org/test/maestro:6a302e67a1ade4ad5d10f974
      history:  > ✅  > ⚠️  > ✅  > ⚠️  > ✅  
            
Hardware: imx8mp-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.alsa
      last run: https://d.kernelci.org/test/maestro:6a303bb5a1ade4ad5d11bc96
      history:  > ✅  > ❌  > ✅  
            
      - kselftest.alsa.alsa_pcm-test
      last run: https://d.kernelci.org/test/maestro:6a304003a1ade4ad5d12038a
      history:  > ✅  > ❌  > ✅  
            
Hardware: qemu-x86_64
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - boot
      last run: https://d.kernelci.org/test/maestro:6a303535a1ade4ad5d11733b
      history:  > ⚠️  > ✅  > ✅  > ⚠️  > ✅  
            



This branch has 1 pre-existing build issues. See details in the dashboard.

Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
