Received: from mail-dl1-f67.google.com (mail-dl1-f67.google.com [74.125.82.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E42B726D4C7
	for <linux-next@vger.kernel.org>; Fri,  6 Feb 2026 02:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770345012; cv=none; b=ajHmd8nOzPS7ti0bp6urX6xd/uckEb3QBMJHj5x6naJkViAK1cGHD30PUeBc88p8ZXXwk9b6I9b6uqrHL7ROtBSfMehyXNL33P6etj9NArwV8gv441Cf49W+3MGShYpSME7aCMLgYiakgf5uq0v8hJu52s8rYTf3YUrSTMBdkHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770345012; c=relaxed/simple;
	bh=6YJhof86Y1rbXC8P6x4EoaCYm61h+umRdAuhQtavt5g=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=rvSzZqXB68HSMzGOZKk+BPdF7pdfHTJsN++l7PGM6ynOByheLQXL3LmCrSs/H0mxg/7sIU+0UmyfqHWoUdRlaFg5GADCwyqwp//vXw0lwlIvJHGPikb++Pu3RVu1+gbPfYVPkEt9D8IZgOpA392Xzwk+PDhdxLhDQF1/94lA014=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=DIUa5xjt; arc=none smtp.client-ip=74.125.82.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="DIUa5xjt"
Received: by mail-dl1-f67.google.com with SMTP id a92af1059eb24-124899ee9d3so1265061c88.0
        for <linux-next@vger.kernel.org>; Thu, 05 Feb 2026 18:30:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1770345011; x=1770949811; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fw/SYT+Ohjc+rncS8m1jLbyGXQhfSOqDV8rmsPu5/0k=;
        b=DIUa5xjt8TDRif/52TQuspswARJyaQ9WcETkbpZU8WVsGnIrdoOQVRKAFQUULzTbJT
         Qt2fkQVxmlkgLBMPFdI2ouPR7yDTpN2H6GS4lQWQa4JtZje1LMEehddQ0LVsQsxMEVqU
         8+3G6iCqzvDBn66im/V61WtbsDVAAxvS+rsNAqbvqzuH8bLl+/OsUiZiZOrtGBuCxTUW
         rQPXxjnM7/+DTWsQbE0AS6vIOa+Hc0wZAoffOT2E53J2XmmpBXno8ueeNggDNWUow7ot
         e/Nzp+g1e8DAjrhnJRu8AcJ+GgawJee+OQHj3pqxBskUdPcVhCY6MD5h0c5MqOzUqKBs
         ZSuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770345011; x=1770949811;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Fw/SYT+Ohjc+rncS8m1jLbyGXQhfSOqDV8rmsPu5/0k=;
        b=iDWh5gXucTi2JnQdVJP+rFR7F1tIe0B8e2AbOX9rMau1OMc49HnMslVfRlng7csMfq
         aIghPcArBNS462xI6orxlocaV+hyzp5tplsFCd49ptKoZZGi9a/tX+UglBcVYFqiM6Lf
         O/8fzq5JOk6gRndgkpKS/BPz62KZSCKHAt/9o2h4gxmccicGTGgMaSD5/jyIHi43SjYt
         5boUoI3W35LJRydnsy4rumx8Ko78gClS163oZ7tB+wH25c7uCYWJoM/WC1QnKr1RGnF2
         viX60SiPaiW+71f6apTTuYww41M3O14/4/Wu+MH19vZgk/FuPGvT1KyWV0zodDX33xc9
         n9hw==
X-Gm-Message-State: AOJu0YyiKdo+c73KAzoklrDxLiIn/zl1T2mNsrqIm/tahImnLFZ94hvV
	syl8PpvhUmNjZcfljKTUmPu7pmPLhsRHJ+QyuOxZZGhxaxcPubwXNx58Y9Eq8q3Fsi+wV0tY/tm
	xRrxeA1o=
X-Gm-Gg: AZuq6aLp33xinNjY6eTiN/qP8lXNBawlnlTHFhkTe5vqecIUWsh3Lptmbmk5vDAQay8
	MVbG9cvUIni8pcOjsM0TSf1bjK/d4/XnomNZ5mVd9LDyVAkpL6UpioHKapDk+VC4vCfsZSiqmUl
	RaoU/b/mUWBA/cwR+aJRTFlImRnCsv6lAWnW6D31zmzOItqIh9b1cNdZavD4+SJmU5vrEcz2r4I
	LP5874rM9/P8MSG9IiJ6RNSlaWqloHZt08fF496LrsinvbMW6NixW7eYr6UTUYSsXqRobFPqTc5
	Xr4qLusTZxucIkrtYq61ggSK8Vl6GFrzKNMugx16Ba4GX+HzvAU/mDWrnC0UB+lX3DNGk5TIHYR
	Cp1WRrCc9sRrlcJOM3AFInZCYdL0mxlS+sv83RH2pgLj1KGA0CYW1L443P0alaSX2Mx8mFOiG/y
	vNdUTM
X-Received: by 2002:a05:7022:251f:b0:121:d898:edae with SMTP id a92af1059eb24-12703fdf5f3mr521232c88.24.1770345010909;
        Thu, 05 Feb 2026 18:30:10 -0800 (PST)
Received: from 22d5995788c3 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-127041d9a67sm943008c88.4.2026.02.05.18.30.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 18:30:10 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - 9845cf73f7db6094c0d8419d6adb848028f4a921
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Fri, 06 Feb 2026 02:30:10 -0000
Message-ID: <177034500970.7631.12874532519255918192@22d5995788c3>





Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/9845cf73f7db6094c0d8419d6adb848028f4a921/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 9845cf73f7db6094c0d8419d6adb848028f4a921
origin: maestro
test start time: 2026-02-05 15:24:49.171000+00:00

Builds:	   33 ✅    6 ❌    0 ⚠️
Boots: 	   54 ✅    4 ❌    0 ⚠️
Tests: 	 1028 ✅    1 ❌   97 ⚠️

### POSSIBLE REGRESSIONS

  No possible regressions observed.


### FIXED REGRESSIONS
    
Hardware: meson-g12b-a311d-khadas-vim3
  > Config: defconfig+preempt_rt
    - Architecture/compiler: arm64/gcc-14
      - rt-tests.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6984c1eda1ae387ffbc0fe89
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - rt-tests.rt-migrate-test.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6984c2e4a1ae387ffbc0ff9d
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            


### UNSTABLE TESTS
    
Hardware: qemu-arm64
  > Config: defconfig+preempt_rt
    - Architecture/compiler: arm64/gcc-14
      - rt-tests.svsematest
      last run: https://d.kernelci.org/test/maestro:6984c5faa1ae387ffbc1059c
      history:  > ✅  > ✅  > ✅  > ⚠️  
            



This branch has 6 pre-existing build issues. See details in the dashboard.

Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
