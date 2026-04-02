Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7711C27816C
	for <linux-next@vger.kernel.org>; Thu,  2 Apr 2026 02:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775097048; cv=none; b=GFoMsdIP1wiAuzRDO068xJAyMsmXvdVdyDgtflOvbn7gvip1E+CcECTr5Doi/u1TRnzDItvTtqFkLtxyq3DM+S1zs/KIOwNB3X4R2Ha1cRlOmdYCb3xLHHGHmSY0o1YjMFpyOsQBqygizNBf4Cln7PqzbPmCgjMzqwUmWBokKbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775097048; c=relaxed/simple;
	bh=bhi91k8SgIRSUqiQtxMj/MORHbQefJ8cgNEuUyc5lTk=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=BbXI1VMhAzB5sYMGYZ8Tpq2rxo5D76ExQZInzIl63Zamam66TUjbvSHiSdk/YjQPinWLuDnKM3El+VOXmjXeLM70KCpa6gNIQant1TeYF668hB/xnZS0nsuDtzHA6qEZEK3CC2w3FcQVS/S1C2lY4KZXGAFqyACfgJMs3GHqtAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=k9ql1/ue; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="k9ql1/ue"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2c1632faeb9so891124eec.0
        for <linux-next@vger.kernel.org>; Wed, 01 Apr 2026 19:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1775097043; x=1775701843; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MjDL1EDNUdyXaQbg0qfIDOmPuX/2/dtV8/Urx9CQ9ic=;
        b=k9ql1/uenrhFDQNRd8QPZr0735hcKzjHldrgevh7xllbDp5fnjI9gpDpgkJLGraxUk
         QxuxFeY7fT7My3g/NG2xE7p7+Xa/iFXf3LMy30XQ1Hmv/rIj8t7yBMNHW4Pk0n0ksVwZ
         poImXYe8powHK/0sovdCzvQ0qOjcDkL19/EiroWBNdAPWttq7F3Ke8OfVTTSa/wyAqlf
         o0GGPRUKL5c7kqyY4MyzsvIZqJOx1ucmwLG6XkMRivRvQ2vlJd6NX4osgRN23PHmhzWj
         79SwA/K08AtqcTjM+I55yzQbCc+kABnqP3f7p4ujVPCaoOSga6kbgH9gn1XAdUhjDG3+
         5mvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775097043; x=1775701843;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MjDL1EDNUdyXaQbg0qfIDOmPuX/2/dtV8/Urx9CQ9ic=;
        b=h6slZWkMwM15N5b2CaWmK/PiWAHmjrNQCKETPum1F3XK/xXFGRfHP+zhT6x/FsUXG4
         fWq0aGWyK7m3ZSQJQnanZ6ZCCs77tSq6uGpHw0cCDk3HC5UUZdfwEtk3WoQWkS+2LvRv
         QshyLL0tAKMC/XMK0eTFEHnaRU9AR9p3aAIxVKnRAOHB+6otsB1ttzAvsZlujOsw6qTd
         W4+cpnzYdp9G4Njbt+8SwEIf8/7JUSV/S2AafXWhLTleoa6gBCOLur7dIT1VSroKTAQA
         i9dvdRSvspz6Z4BjXf7R2ENGosYTvQtD72fxFC9p6W3tFKjH/LHJfuO17QCYMW6VJoPD
         W8Aw==
X-Gm-Message-State: AOJu0YzX3UlEkbubaINVguG5HZhkH+WBSIhydv2Ym3mn0+MfAA3XHCb7
	9p7pVKWEzn8ljNPC5dxttTExnEDIiw3qXP2m0393We6n8zNt5r8ZgzdYgWo66/L9eDutHxPbQVP
	lcVG8
X-Gm-Gg: ATEYQzwwdgRVcdEySoRCQAydotSpqGApiglzvzt12oaWwean5pOFf4W943rR+tNuDJE
	vq+O0+HcQyFz4sEeA0EZV965iGiXaBJloL9JVaSfSc0BHfRGTOnwcg15eKKTdNQi/zcftingIIl
	MWMrQESZl8h5Rv3btlO+/Btumw/+QP6CpNAo6QjNS1bBhD854s4JxEftTXvKkuqkSSff0ZtAh19
	T5BgzdQyY87cFh0n4oUY2RwF/TBZciRXTXJ5B1un9JwU8WDv7HsLV0IXUCE0pjOdTsPmubMHyQj
	XErII1qxznB028ubcAfecWy5EaHUBpFemGLb0GVU7JW8Zuk1WZ2gNH/5pNRAX3RMsCNb/U8vpis
	unxNoRTauGffBGJiwD49KZU33AhziFWcHGIQd3DHbzcJc6VD8Y393xKeoEOebm9Jzz+vQ5yFqh8
	ujc4z5DKQXVljLpkB/
X-Received: by 2002:a05:7301:128f:b0:2c5:3b87:2ffb with SMTP id 5a478bee46e88-2c930e75625mr3559068eec.13.1775097042800;
        Wed, 01 Apr 2026 19:30:42 -0700 (PDT)
Received: from 984b78e0ad75 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ca792f3f54sm1224662eec.7.2026.04.01.19.30.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 19:30:42 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: [STATUS] next/master - bd0f139e5fc11182777b81cefc3893ea508544ec
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Thu, 02 Apr 2026 02:30:42 -0000
Message-ID: <177509704163.1264.12995904099317935683@984b78e0ad75>





Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/bd0f139e5fc11182777b81cefc3893ea508544=
ec/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: bd0f139e5fc11182777b81cefc3893ea508544ec
origin: maestro
test start time: 2026-04-01 15:16:45.551000+00:00

Builds:	   14 =E2=9C=85   43 =E2=9D=8C    0 =E2=9A=A0=EF=B8=8F
Boots: 	    6 =E2=9C=85    0 =E2=9D=8C    0 =E2=9A=A0=EF=B8=8F
Tests: 	  845 =E2=9C=85   68 =E2=9D=8C   63 =E2=9A=A0=EF=B8=8F

### POSSIBLE REGRESSIONS
   =20
Hardware: mt8183-kukui-jacuzzi-juniper-sku16
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=3Dn=
+CONFIG_MODULE_COMPRESS_NONE=3Dy
    - Architecture/compiler: arm64/gcc-14
      - kselftest.cpufreq
      last run: https://d.kernelci.org/test/maestro:69cd4a44dcae953c056b7158
      history:  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=
=9D=8C =20
           =20
      - kselftest.cpufreq.hibernate
      last run: https://d.kernelci.org/test/maestro:69cd4a4bdcae953c056b716c
      history:  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=9D=8C =20
           =20
      - kselftest.cpufreq.hibernate.shardfile-cpufreq
      last run: https://d.kernelci.org/test/maestro:69cd4b21dcae953c056b76c3
      history:  > =E2=9C=85  > =E2=9C=85  > =E2=9D=8C =20
           =20
      - kselftest.cpufreq.shardfile-cpufreq
      last run: https://d.kernelci.org/test/maestro:69cd4cbddcae953c056b7a2e
      history:  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=
=9D=8C =20
           =20
      - kselftest.cpufreq.suspend
      last run: https://d.kernelci.org/test/maestro:69cd4a51dcae953c056b7193
      history:  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=
=9D=8C =20
           =20
      - kselftest.cpufreq.suspend.shardfile-cpufreq
      last run: https://d.kernelci.org/test/maestro:69cd4b48dcae953c056b77a3
      history:  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=9D=8C =20
           =20
      - kselftest.devices-probe
      last run: https://d.kernelci.org/test/maestro:69cd4a3ddcae953c056b7146
      history:  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=
=9D=8C =20
           =20
      - kselftest.devices-probe.shardfile-devices_probe
      last run: https://d.kernelci.org/test/maestro:69cd4b39dcae953c056b7724
      history:  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=
=9D=8C =20
           =20
      - kselftest.dmabuf-heaps
      last run: https://d.kernelci.org/test/maestro:69cd4a58dcae953c056b74d1
      history:  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=9D=8C =20
           =20
      - kselftest.dmabuf-heaps.shardfile-dmabuf-heaps
      last run: https://d.kernelci.org/test/maestro:69cd4b26dcae953c056b76e4
      history:  > =E2=9C=85  > =E2=9C=85  > =E2=9D=8C =20
           =20
      - kselftest.dt.shardfile-dt
      last run: https://d.kernelci.org/test/maestro:69cd4cb1dcae953c056b79b8
      history:  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=
=9D=8C =20
           =20
      - kselftest.exec
      last run: https://d.kernelci.org/test/maestro:69cd4a5fdcae953c056b7545
      history:  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=
=9D=8C =20
           =20
      - kselftest.exec.shardfile-exec
      last run: https://d.kernelci.org/test/maestro:69cd4c04dcae953c056b7926
      history:  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=9D=8C =20
           =20
      - kselftest.iommu.shardfile-iommu
      last run: https://d.kernelci.org/test/maestro:69cd4bb8dcae953c056b7852
      history:  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=9D=8C =20
           =20
Hardware: mt8195-cherry-tomato-r2
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=3Dn=
+CONFIG_MODULE_COMPRESS_NONE=3Dy
    - Architecture/compiler: arm64/gcc-14
      - kselftest.cpufreq
      last run: https://d.kernelci.org/test/maestro:69cd4a45dcae953c056b715b
      history:  > =E2=9C=85  > =E2=9C=85  > =E2=9D=8C =20
           =20
      - kselftest.cpufreq.hibernate
      last run: https://d.kernelci.org/test/maestro:69cd4a4cdcae953c056b716f
      history:  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=
=9D=8C =20
           =20
      - kselftest.cpufreq.hibernate.shardfile-cpufreq
      last run: https://d.kernelci.org/test/maestro:69cd4ba9dcae953c056b7836
      history:  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=9D=8C =20
           =20
      - kselftest.cpufreq.shardfile-cpufreq
      last run: https://d.kernelci.org/test/maestro:69cd4be5dcae953c056b78eb
      history:  > =E2=9C=85  > =E2=9C=85  > =E2=9D=8C =20
           =20
      - kselftest.cpufreq.suspend
      last run: https://d.kernelci.org/test/maestro:69cd4a53dcae953c056b7196
      history:  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=
=9D=8C =20
           =20
      - kselftest.cpufreq.suspend.shardfile-cpufreq
      last run: https://d.kernelci.org/test/maestro:69cd4b2bdcae953c056b76f3
      history:  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=
=9D=8C =20
           =20
      - kselftest.devices-probe.shardfile-devices_probe
      last run: https://d.kernelci.org/test/maestro:69cd4b21dcae953c056b76bd
      history:  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=
=9D=8C =20
           =20
      - kselftest.dt.shardfile-dt
      last run: https://d.kernelci.org/test/maestro:69cd4ae7dcae953c056b7616
      history:  > =E2=9C=85  > =E2=9C=85  > =E2=9D=8C =20
           =20
      - kselftest.iommu.shardfile-iommu
      last run: https://d.kernelci.org/test/maestro:69cd4b00dcae953c056b7632
      history:  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=
=9D=8C =20
           =20
Hardware: sc7180-trogdor-kingoftown
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=3Dn=
+CONFIG_MODULE_COMPRESS_NONE=3Dy
    - Architecture/compiler: arm64/gcc-14
      - kselftest.cpufreq
      last run: https://d.kernelci.org/test/maestro:69cd4a40dcae953c056b714f
      history:  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=
=9D=8C =20
           =20
      - kselftest.cpufreq.hibernate
      last run: https://d.kernelci.org/test/maestro:69cd4a47dcae953c056b7161
      history:  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=
=9D=8C =20
           =20
      - kselftest.cpufreq.hibernate.shardfile-cpufreq
      last run: https://d.kernelci.org/test/maestro:69cd4b18dcae953c056b767c
      history:  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=
=9D=8C =20
           =20
      - kselftest.cpufreq.shardfile-cpufreq
      last run: https://d.kernelci.org/test/maestro:69cd4b1ddcae953c056b7691
      history:  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=
=9D=8C =20
           =20
      - kselftest.cpufreq.suspend
      last run: https://d.kernelci.org/test/maestro:69cd4a4edcae953c056b7175
      history:  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=
=9D=8C =20
           =20
      - kselftest.cpufreq.suspend.shardfile-cpufreq
      last run: https://d.kernelci.org/test/maestro:69cd4b13dcae953c056b765c
      history:  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=
=9D=8C =20
           =20
      - kselftest.dmabuf-heaps
      last run: https://d.kernelci.org/test/maestro:69cd4a54dcae953c056b719c
      history:  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=
=9D=8C =20
           =20
      - kselftest.dmabuf-heaps.shardfile-dmabuf-heaps
      last run: https://d.kernelci.org/test/maestro:69cd4b30dcae953c056b7704
      history:  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=
=9D=8C =20
           =20
      - kselftest.dt.shardfile-dt
      last run: https://d.kernelci.org/test/maestro:69cd4b1fdcae953c056b76b7
      history:  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=
=9D=8C =20
           =20
      - kselftest.exec
      last run: https://d.kernelci.org/test/maestro:69cd4a5bdcae953c056b753b
      history:  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=
=9D=8C =20
           =20
      - kselftest.exec.shardfile-exec
      last run: https://d.kernelci.org/test/maestro:69cd4b3bdcae953c056b772e
      history:  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=
=9D=8C =20
           =20
      - kselftest.iommu.shardfile-iommu
      last run: https://d.kernelci.org/test/maestro:69cd4b48dcae953c056b779d
      history:  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=
=9D=8C =20
           =20
Hardware: sc7180-trogdor-lazor-limozeen
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=3Dn=
+CONFIG_MODULE_COMPRESS_NONE=3Dy
    - Architecture/compiler: arm64/gcc-14
      - kselftest.cpufreq
      last run: https://d.kernelci.org/test/maestro:69cd4a41dcae953c056b7152
      history:  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=
=9D=8C =20
           =20
      - kselftest.cpufreq.hibernate
      last run: https://d.kernelci.org/test/maestro:69cd4a48dcae953c056b7164
      history:  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=
=9D=8C =20
           =20
      - kselftest.cpufreq.hibernate.shardfile-cpufreq
      last run: https://d.kernelci.org/test/maestro:69cd4af5dcae953c056b761d
      history:  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=9D=8C =20
           =20
      - kselftest.cpufreq.shardfile-cpufreq
      last run: https://d.kernelci.org/test/maestro:69cd4b18dcae953c056b7676
      history:  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=9D=8C =20
           =20
      - kselftest.cpufreq.suspend
      last run: https://d.kernelci.org/test/maestro:69cd4a4fdcae953c056b7178
      history:  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=
=9D=8C =20
           =20
      - kselftest.cpufreq.suspend.shardfile-cpufreq
      last run: https://d.kernelci.org/test/maestro:69cd4b74dcae953c056b77f9
      history:  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=9D=8C =20
           =20
      - kselftest.dmabuf-heaps
      last run: https://d.kernelci.org/test/maestro:69cd4a56dcae953c056b719f
      history:  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=
=9D=8C =20
           =20
      - kselftest.dmabuf-heaps.shardfile-dmabuf-heaps
      last run: https://d.kernelci.org/test/maestro:69cd4b99dcae953c056b782c
      history:  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=9D=8C =20
           =20
      - kselftest.dt
      last run: https://d.kernelci.org/test/maestro:69cd4a3adcae953c056b7143
      history:  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=
=9D=8C =20
           =20
      - kselftest.dt.shardfile-dt
      last run: https://d.kernelci.org/test/maestro:69cd4b3bdcae953c056b7760
      history:  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=9D=8C =20
           =20
      - kselftest.exec
      last run: https://d.kernelci.org/test/maestro:69cd4a5ddcae953c056b753e
      history:  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=
=9D=8C =20
           =20
      - kselftest.exec.shardfile-exec
      last run: https://d.kernelci.org/test/maestro:69cd4bd2dcae953c056b7860
      history:  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=9D=8C =20
           =20
      - kselftest.iommu.shardfile-iommu
      last run: https://d.kernelci.org/test/maestro:69cd4bebdcae953c056b78f2
      history:  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=9D=8C =20
           =20
Hardware: sc7180-trogdor-wormdingler-rev1-boe
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=3Dn=
+CONFIG_MODULE_COMPRESS_NONE=3Dy
    - Architecture/compiler: arm64/gcc-14
      - kselftest.cpufreq
      last run: https://d.kernelci.org/test/maestro:69cd4a42dcae953c056b7155
      history:  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=
=9D=8C =20
           =20
      - kselftest.cpufreq.hibernate
      last run: https://d.kernelci.org/test/maestro:69cd4a49dcae953c056b7167
      history:  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=
=9D=8C =20
           =20
      - kselftest.cpufreq.hibernate.shardfile-cpufreq
      last run: https://d.kernelci.org/test/maestro:69cd4b17dcae953c056b766d
      history:  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=
=9D=8C =20
           =20
      - kselftest.cpufreq.shardfile-cpufreq
      last run: https://d.kernelci.org/test/maestro:69cd4b11dcae953c056b764f
      history:  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=
=9D=8C =20
           =20
      - kselftest.cpufreq.suspend
      last run: https://d.kernelci.org/test/maestro:69cd4a50dcae953c056b7190
      history:  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=
=9D=8C =20
           =20
      - kselftest.cpufreq.suspend.shardfile-cpufreq
      last run: https://d.kernelci.org/test/maestro:69cd4b38dcae953c056b771c
      history:  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=
=9D=8C =20
           =20
      - kselftest.dmabuf-heaps
      last run: https://d.kernelci.org/test/maestro:69cd4a57dcae953c056b71a4
      history:  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=
=9D=8C =20
           =20
      - kselftest.dmabuf-heaps.shardfile-dmabuf-heaps
      last run: https://d.kernelci.org/test/maestro:69cd4b42dcae953c056b7785
      history:  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=
=9D=8C =20
           =20
      - kselftest.exec
      last run: https://d.kernelci.org/test/maestro:69cd4a5edcae953c056b7542
      history:  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=
=9D=8C =20
           =20
      - kselftest.exec.shardfile-exec
      last run: https://d.kernelci.org/test/maestro:69cd4b44dcae953c056b7794
      history:  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=
=9D=8C =20
           =20
      - kselftest.iommu.shardfile-iommu
      last run: https://d.kernelci.org/test/maestro:69cd4b19dcae953c056b7684
      history:  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=
=9D=8C =20
           =20


### FIXED REGRESSIONS

  No fixed regressions observed.


### UNSTABLE TESTS

  No unstable tests observed.

### NEW BUILD ISSUES
- Issue: maestro:bd2fe3ab76492e9353ac17daa50a9ba5a205b973 | version: 1
  Build: maestro:69cd3860dcae953c056b53b7
  Comment:  in testcases/fake_sigreturn_bad_size (Makefile:31) [logspec:kbu=
ild,kbuild.other]
  First seen: 2026-04-01 15:53:50.199131+00:00
  Culprit: code
- Issue: maestro:5220c2e06a566676f041c198857665ab175b9ef8 | version: 1
  Build: maestro:69cd3871dcae953c056b53ca
  Comment:  in testcases/fake_sigreturn_bad_magic (Makefile:31) [logspec:kb=
uild,kbuild.other]
  First seen: 2026-04-01 16:12:30.147032+00:00
  Culprit: code
- Issue: maestro:b5ea0020699d6ea2fad0d46696c2f2ac1ef88d9c | version: 1
  Build: maestro:69cd37eadcae953c056b530f
  Comment:  ./test_signals.h./test_signals.h./test_signals.h./test_signals.=
h:./test_signals.h:::::151515151515:::::1010101010:::::     fatal error: fa=
tal error: fatal error: 'asm/hwcap.h' file not foundfatal error: 'asm/hwcap=
.h' file not foundfatal error: 'asm/hwcap.h' file not found'asm/hwcap.h' fi=
le not found :         1515 | 15 | # | #   i#in15inc | nlcc#ulldiu   uen151=
0dd  | :cee<# l  aifatal error: u<s<ndma'asm/hwcap.h' file not foundca/es .=
/test_signals.h:15:10: fatal error: 'asm/hwcap.h' file not found ./test_sig=
nals.h:15:10: fatal error: 'asm/hwcap.h' file not found ./test_signals.h:15=
:10: fatal error: 'asm/hwcap.h' file not found ./test_signals.h:15:10: fata=
l error: 'asm/hwcap.h' file not found ./test_signals.h:15:10: fatal error: =
'asm/hwcap.h' file not found ./test_signals.h:15:10: fatal error: 'asm/hwca=
p.h' file not found ./test_signals.h:15:10: fatal error: 'asm/hwcap.h' file=
 not found ./test_signals.h:15:10: fatal error: 'asm/hwcap.h' file not foun=
d ./test_signals.h:15:10: fatal error: 'asm/hwcap.h' file not found ./test_=
signals.h:15:10: fatal error: 'asm/hwcap.h' file not found : ./test_signals=
.hfatal error: :'asm/hwcap.h' file not found15 :10: fatal error: 'asm/hwcap=
.h' file not found ./test_signals.h:15:10: fatal error: 'asm/hwcap.h' file =
not found ./test_signals.h:15:10: fatal error: 'asm/hwcap.h' file not found=
 ./test_signals.h:15:10: fatal error: 'asm/hwcap.h' file not found ./test_s=
ignals.h:15:10: fatal error: 'asm/hwcap.h' file not found ./test_signals.h:=
15:10: fatal error: 'asm/hwcap.h' file not found /usr/include/x86_64-linux-=
gnu/asm/sigcontext.h:40:8: error: In file included from redefinition of '_f=
px_sw_bytes' /usr/include/x86_64-linux-gnu/asm/sigcontext.h:40:8: error: In=
 file included from redefinition of '_fpx_sw_bytes' u/usr/include/x86_64-li=
nux-gnu/asm/sigcontext.hc:t40: 8   _:40  | error: In file included from sre=
definition of '_fpx_sw_bytes' tru8c:t  error: _redefinition of '_fpx_sw_byt=
es'f /usr/include/x86_64-linux-gnu/asm/sigcontext.h   :3140: | 8s:  t_error=
: rfredefinition of '_fpx_sw_bytes'up r error: _redefinition of '_fpreg'f :=
        | /usr/include/x86_64-linux-gnu/bits/sigcontext.h_error:        ^:f=
redefinition of '_fpreg' error: redefinition of '_fpreg' r8testcases/testca=
ses.ce::g  7error: {: 40r8In file included from :u:testcases/testcases.h8c =
::terror: 15  : p91x:r   8   e40:91g |   |  serror: s{tredefinition of '_fp=
xreg't :   p      468x | :rs eterror: rgredefinition of '_fpxreg'u  846In f=
ile included from u: | testcases/testcases.cc s:terror: t7/usr/include/x86_=
64-linux-gnu/bits/sigcontext.h redefinition of '_fpxreg'r: error: _46 :p53I=
n file included from   | testcases/testcases.hxerror: s:rredefinition of '_=
xmmreg't15eIn file included from  :x | testcases/testcases.h ms:error: m15r=
edefinition of '_xmmreg'tr: x:smt rmerror: urredefinition of '_xmmreg'ce /u=
sr/include/x86_64-linux-gnu/asm/sigcontext.h:180:8: error: redefinition of =
'_ymmh_state' rerror: /usr/include/x86_64-linux-gnu/asm/sigcontext.huredefi=
nition of '_ymmh_state':c 180t: 8_:y merror:   mredefinition of '_ymmh_stat=
e'180h error:   | /usr/include/x86_64-linux-gnu/asm/sigcontext.hredefinitio=
n of '_ymmh_state'{s: error:  _redefinition of '_ymmh_state'y r:hu /usr/inc=
lude/x86_64-linux-gnu/asm/sigcontext.h_cerror: s:tredefinition of '_xstate'=
40t  s8   t:40a  | terror: seredefinition of '_xstate't In file included fr=
om  r/usr/include/x86_64-linux-gnu/bits/sigcontext.h_/usr/include/x86_64-li=
nux-gnu/asm/sigcontext.hu:s:c189w192tIn file included from ::_ 88testcases/=
testcases.cb:_:: yx7error: t : tr  uerror: _c/usr/include/x86_64-linux-gnu/=
bits/sigcontext.hredefinition of '_xstate'x: /usr/include/x86_64-linux-gnu/=
asm/sigcontext.h:85:8: error: redefinition of '_fpreg' /usr/include/x86_64-=
linux-gnu/asm/sigcontext.h:91:8: error: redefinition of '_fpxreg' :/usr/inc=
lude/x86_64-linux-gnu/asm/sigcontext.h317::8317:In file included from : tes=
tcases/testcases.cIn file included from 8error: :testcases/testcases.c:7red=
efinition of 'sigcontext':: 7In file included from error: : error: c rIn fi=
le included from redefinition of '_xmmreg'terror: utestcases/testcases.h  /=
usr/include/x86_64-linux-gnu/asm/sigcontext.h:180:8: error: redefinition of=
 '_ymmh_state' /usr/include/x86_64-linux-gnu/asm/sigcontext.h:192:8: error:=
 redefinition of '_xstate' :101:_25testcases/testcases.hx:101:s:25 :t101err=
or: :25a:invalid application of 'sizeof' to an incomplete type 'struct _aar=
ch64_ctx': t25  error: :eerror: invalid application of 'sizeof' to an incom=
plete type 'struct _aarch64_ctx' error:  dr,r/usr/include/x86_64-linux-gnu/=
asm/sigcontext.he uu:urcc317i(tnt:st 8 t3_:r_2a ua_aerror: catrredefinition=
 of 'sigcontext' tc /usr/include/x86_64-linux-gnu/asm/sigcontext.h:192:8: e=
rror: redefinition of '_xstate' :testcases/testcases.he  :error: {invalid a=
pplication of 'sizeof' to an incomplete type 'struct _aarch64_ctx'104   :10=
4      27 | | :               ^ werror:  h 6i4nline    s95ttestcases/testca=
ses.h | r:us104ct:at27t :i_ ca_error:  ainvalid application of 'sizeof' to =
an incomplete type 'struct _aarch64_ctx'cir 6:ti rnerror: utredefinition of=
 'sigcontext'c3 ::t  13rnote: error: uforward declaration of 'struct _aarch=
64_ctx':/usr/include/x86_64-linux-gnu/bits/sigcontext.hincomplete definitio=
n of type 'struct _aarch64_ctx'c  terror: 139 incomplete definition of type=
 'struct _aarch64_ctx':_ error: i      iincomplete definition of type 'stru=
ct _aarch64_ctx'| nn iinnee  ssttruct _raucatrtestcases/testcases.h c:_h105=
a6:a413r:_ ccerror: ht  incomplete definition of type 'struct _aarch64_ctx'=
6x105 :t95:105a:105t:22i:37:c37:  : note:  error: forward declaration of 's=
truct _aarch64_ctx'error: incomplete definition of type 'struct _aarch64_ct=
x' e95a | dsetra(tisct    r95iu | ntestcases/testcases.hsl:ti105an:t37ei: c=
 cserror:  tincomplete definition of type 'struct _aarch64_ctx'ir error: nt=
      incomplete definition of type 'struct _aarch64_ctx'l3|  h64_testcases=
/testcases.hc:tx106 :  *15105g:e  | terror:         _incomplete definition =
of type 'struct _aarch64_ctx' h :i22 nerror: :eincomplete definition of typ=
e 'struct _aarch64_ctx'  2i:_n tterror:  testcases/testcases.h3incomplete d=
efinition of type 'struct _aarch64_ctx'm:2a28_g:ti2c:,  95:S      :10V22:| =
_:                        ^~~~~~~~~~~~~~~~~~~~~~~~error:  N da aerror: )d;t=
  du rtestcases/testcases.hec*cr:thh(1016e :s4a25_t_:darc ,auterror:  cxrin=
valid application of 'sizeof' to an incomplete type 'struct _aarch64_ctx'ut=
  :10g109:i: c10error: ,   :incomplete definition of type 'struct _aarch64_=
ctx'testcases/testcases.h 10i:z e  error: o109incomplete definition of type=
 'struct _aarch64_ctx'f   |  error: invalid application of 'sizeof' to an i=
ncomplete type 'struct _aarch64_ctx' testcases/testcases.h *:)129(:testcase=
s/testcases.h(7:c:95 h:error: 22aincomplete definition of type 'struct _aar=
ch64_ctx': l+;error: i 276h:46 _error: 4cinvalid application of 'sizeof' to=
 an incomplete type 'struct _aarch64_ctx'_t cxt x* h*e  ha104ed | a,       =
 d wtestcases/testcases.h,uh:ii 130lnu:eti 7h3(:ne2 otaerror: _fd3incomplet=
e definition of type 'struct _aarch64_ctx'fte2 :7testcases/testcases.h:test=
cases/testcases.htestcases/testcases.h :error: :28incomplete definition of =
type 'struct _aarch64_ctx'130: :27::  note: error: expanded from macro 'HDR=
_SZ'incomplete definition of type 'struct _aarch64_ctx'   testcases/testcas=
es.h:105:13   :95  | error: sincomplete definition of type 'struct _aarch64=
_ctx' tx *head, utestcases/testcases.h:105i:n37:t error: 3incomplete defini=
tion of type 'struct _aarch64_ctx'2 uct _aar   c95h | 6s4_ttestcases/testca=
ses.hcat:tx129i :c*7 h:ie anerror: dlincomplete definition of type 'struct =
_aarch64_ctx',i  95r | csht6a4ti_cc tixn li*nge struct _aeatrtestcases/test=
cases.hc_:hh1056e:4a37_dc:te xrerror:  (incomplete definition of type 'stru=
ct _aarch64_ctx'*s testcases/testcases.h:   13095: | 7s:t aerror: tincomple=
te definition of type 'struct _aarch64_ctx'i c inl  i130n | e              =
   sttaritestcases/testcases.hlu:-c107>:s10i: zerror: eincomplete definitio=
n of type 'struct _aarch64_ctx'  hr6c4h_64c_tcxtx  **g)e(t(_chheatestcases/=
testcases.hra: d106*e:)15(r:h )error:  incomplete definition of type 'struc=
t _aarch64_ctx'+ uct _aarch64_ctx *head, uint32testcases/testcases.h_t: 109=
:m10a:g icerror: ,incomplete definition of type 'struct _aarch64_ctx' :109:=
10:testcases/testcases.h :error: 95incomplete definition of type 'struct _a=
arch64_ctx': nline struct _aarchtestcases/testcases.h6:4130_:c7t:x  *error:=
 gincomplete definition of type 'struct _aarch64_ctx'e testcases/testcases.=
h:129:7: error: incomplete definition of type 'struct _aarch64_ctx' testcas=
es/testcases.h:130:7: error: incomplete definition of type 'struct _aarch64=
_ctx' /usr/include/x86_64-linux-gnu/asm/sigcontext.h:40:8: error: redefinit=
ion of '_fpx_sw_bytes' /usr/include/x86_64-linux-gnu/asm/sigcontext.h:85:8:=
 error: redefinition of '_fpreg' /usr/include/x86_64-linux-gnu/asm/sigconte=
xt.h:91:8: error: redefinition of '_fpxreg' /usr/include/x86_64-linux-gnu/a=
sm/sigcontext.h:98:8: error: redefinition of '_xmmreg' /usr/include/x86_64-=
linux-gnu/asm/sigcontext.h:180:8: error: redefinition of '_ymmh_state' /usr=
/include/x86_64-linux-gnu/asm/sigcontext.h:192:8: error: redefinition of '_=
xstate' /usr/include/x86_64-linux-gnu/asm/sigcontext.h:317:8: error: redefi=
nition of 'sigcontext' testcases/testcases.h:101:25: error: invalid applica=
tion of 'sizeof' to an incomplete type 'struct _aarch64_ctx' testcases/test=
cases.h:104:27: error: invalid application of 'sizeof' to an incomplete typ=
e 'struct _aarch64_ctx' testcases/testcases.h:105:13: error: incomplete def=
inition of type 'struct _aarch64_ctx' testcases/testcases.h:105:37: error: =
incomplete definition of type 'struct _aarch64_ctx' testcases/testcases.h:1=
06:15: error: incomplete definition of type 'struct _aarch64_ctx' testcases=
/testcases.h:107:10: error: incomplete definition of type 'struct _aarch64_=
ctx' testcases/testcases.h:109:10: error: incomplete definition of type 'st=
ruct _aarch64_ctx' testcases/testcases.h:129:7: error: incomplete definitio=
n of type 'struct _aarch64_ctx' testcases/testcases.h:130:7: error: incompl=
ete definition of type 'struct _aarch64_ctx' testcases/testcases.ctestcases=
/testcases.ctestcases/testcases.ctestcases/testcases.ctestcases/testcases.c=
:::::18181818::::3434testcases/testcases.c34::34::  : 18error:  error: :err=
or: incomplete definition of type 'struct extra_context'error: 34incomplete=
 definition of type 'struct extra_context'incomplete definition of type 'st=
ruct extra_context':incomplete definition of type 'struct extra_context' er=
ror: incomplete definition of type 'struct extra_context' 18      :      18=
18341818 | : |  |                      |         error: tt18        teincom=
plete definition of type 'struct extra_context'e | trr        ee testcases/=
testcases.c::341818::testcases/testcases.c:: 18:3434error: :18::incomplete =
definition of type 'struct extra_context'34:  error: incomplete definition =
of type 'struct extra_context'incomplete definition of type 'struct extra_c=
ontext' : error: incomplete definition of type 'struct _aarch64_ctx' testca=
ses/testcases.c:19:19: error: incomplete definition of type 'struct _aarch6=
4_ctx'    19 | testcases/testcases.c        :i19f   : 1919( | :!         ti=
error: eftestcases/testcases.cincomplete definition of type 'struct _aarch6=
4_ctx'r :m ( 19testcases/testcases.c!|::|t1919 e::t   testcases/testcases.c=
r e1919:error: :rm | 19m incomplete definition of type 'struct _aarch64_ctx=
'         error: -|:i | 22error:                            ~~~~^:zsredefin=
ition of '_fpx_sw_bytes'|  c| u                     ^,tfatal error:  | fata=
l error:                      ^c too many errors emitted, stopping now [-fe=
rror-limit=3D] mta gfatal error: _itoo many errors emitted, stopping now [-=
ferror-limit=3D]fc fatal error: ,ptoo many errors emitted, stopping now [-f=
error-limit=3D] fatal error: too many errors emitted, stopping now [-ferror=
-limit=3D] /usr/include/x86_64-linux-gnu/asm/sigcontext.h:85:8: error: rede=
finition of '_fpreg' /usr/include/x86_64-linux-gnu/asm/sigcontext.h:91:8: e=
rror: redefinition of '_fpxreg' /usr/include/x86_64-linux-gnu/asm/sigcontex=
t.h:98:8: error: redefinition of '_xmmreg' /usr/include/x86_64-linux-gnu/as=
m/sigcontext.h:180:8: error: redefinition of '_ymmh_state' /usr/include/x86=
_64-linux-gnu/asm/sigcontext.h:192:8: error: redefinition of '_xstate' /usr=
/include/x86_64-linux-gnu/asm/sigcontext.h:317:8: error: redefinition of 's=
igcontext' testcases/testcases.c:18:34: error: incomplete definition of typ=
e 'struct extra_context' &etestcases/testcases.hx:t101r:a25-:> herror: eain=
valid application of 'sizeof' to an incomplete type 'struct _aarch64_ctx'd =
testcases/testcases.c:18:34: error:    incomplete definition of type 'struc=
t extra_context'95 lidate_extra_context(struct extra_contexttestcases/testc=
ases.h :*104e:x27t:r aerror: ,invalid application of 'sizeof' to an incompl=
ete type 'struct _aarch64_ctx'  : error:    incomplete definition of type '=
struct _aarch64_ctx'28 64_ctx *head, uinttestcases/testcases.h3:2105_:t13 :=
 merror: aincomplete definition of type 'struct _aarch64_ctx'g testcases/te=
stcases.h:105:37: error: incomplete definition of type 'struct _aarch64_ctx=
' testcases/testcases.h:106:15: error: incomplete definition of type 'struc=
t _aarch64_ctx' testcases/testcases.h:107:10: error: incomplete definition =
of type 'struct _aarch64_ctx' testcases/testcases.h:109:10: error: incomple=
te definition of type 'struct _aarch64_ctx' 1testcases/testcases.h warning:=
 and 12920 error:s7 generated:. testcases/testcases.h:130:7: error: incompl=
ete definition of type 'struct _aarch64_ctx' testcases/testcases.c:18:34: e=
rror: incomplete definition of type 'struct extra_context' testcases/testca=
ses.c:18:34: error: incomplete definition of type 'struct extra_context' te=
stcases/testcases.c:19:19: error: incomplete definition of type 'struct _aa=
rch64_ctx' fatal error: too many errors emitted, stopping now [-ferror-limi=
t=3D] signals.S:16:19: error: expected ']' in brackets expression signals.S=
:16:19: error: expected ']' in brackets expression signals.S:16:19: error: =
expected ']' in brackets expression signals.S:16:19: error: expected ']' in=
 brackets expression signals.S:16:19: error: expected ']' in brackets expre=
ssion signals.S:16:19: error: expected ']' in brackets expression signals.S=
:16:19: error: expected ']' in brackets expression signals.S:16:19: error: =
expected ']' in brackets expression signals.Ssignals.Ssignals.Ssignals.S:::=
1717:17:22:: 2: signals.S: error: :signals.Sunknown use of instruction mnem=
onic without a size suffixerror: :error: 17 :  :2^ mov x29, sperror: :  mov=
 x29, sp2 : error:  signals.S:signals.S19signals.Ssignals.Ssignals.S::::2:1=
9: 191919error: ::signals.Sunknown use of instruction mnemonic without a si=
ze suffix::2 : :error: error: error:  error: 2unknown use of instruction mn=
emonic without a size suffix^unknown use of instruction mnemonic without a =
size suffix:  unknown use of instruction mnemonic without a size suffixunkn=
own use of instruction mnemonic without a size suffixerror:  error: unknown=
 use of instruction mnemonic without a size suffix signals.Ssignals.Ssignal=
s.Ssignals.S::::20202020signals.S:::::signals.S222221:: : : : :error: 20err=
or: error: 2error: unknown use of instruction mnemonic without a size suffi=
x:: unknown use of instruction mnemonic without a size suffixunknown use of=
 instruction mnemonic without a size suffixunknown use of instruction mnemo=
nic without a size suffix2 error: :  signals.Ssignals.Ssignals.S:signals.S:=
::21212121::::2222: signals.S: : : error: :error: error: error: 21unknown u=
se of instruction mnemonic without a size suffixunknown use of instruction =
mnemonic without a size suffixunknown use of instruction mnemonic without a=
 size suffix:unknown use of instruction mnemonic without a size suffix erro=
r:  signals.S:signals.S24::242signals.Ssignals.S: signals.S:error: ::2unkno=
wn use of instruction mnemonic without a size suffix:2424 : 24:: add x0, x2=
1, x22signals.Serror: : error: : error: error: unknown use of instruction m=
nemonic without a size suffix2unknown use of instruction mnemonic without a=
 size suffix add x0, x21, x22signals.Sunknown use of instruction mnemonic w=
ithout a size suffix error:  add x0, x21, x2225  add x0, x21, x22unknown us=
e of instruction mnemonic without a size suffix ^ add x0, x21, x22error: ^ =
25 signals.S: : signals.S14signals.S25 :: :: 25error: 2514signals.S: unknow=
n token in expression:: 14:  1425error: :  : add x0, x0, #15: unknown token=
 in expression error:  14error:  26  : 14signals.S : signals.S: signals.Ser=
ror: signals.S :26:unknown token in expression:26 :26 :error:  14:  14unkno=
wn token in expression: error: :   error: unknown token in expression error=
: unknown token in expression bic x0, x0, #15 signals.S:28:2: error: unknow=
n use of instruction mnemonic without a size suffixsignals.S : signals.Serr=
or: :signals.Ssignals.S:unknown use of instruction mnemonic without a size =
suffix27:30 2: :  : error: error: ^error: unknown token in expressionunknow=
n use of instruction mnemonic without a size suffix : 2^: signals.Serror: :=
unknown use of instruction mnemonic without a size suffix28 signals.S: sign=
als.S :error: :^27unknown use of instruction mnemonic without a size suffix=
28 ::22: : error: error: unknown use of instruction mnemonic without a size=
 suffixunknown use of instruction mnemonic without a size suffix :: 102sign=
als.S: : ^:error: signals.Serror: 31unknown use of instruction mnemonic wit=
hout a size suffix: :unknown use of instruction mnemonic without a size suf=
fixsignals.Serror: 28 : :   add x23, sp, x22 ^10error:  : unknown use of in=
struction mnemonic without a size suffix  error: signals.S^ unknown token i=
n expression: :error: 2  30: unknown token in expression error: : error:   =
:  ^unknown token in expression30 ^ :  31  error: :signals.S  unknown token=
 in expression2:   : 33  : ldr x0, =3Dcall_fmterror: ^2  signals.S  error: =
 mov x1, x21:  invalid instruction mnemonic 'bl' :  ^error:  ~unknown use o=
f instruction mnemonic without a size suffix  signals.Serror: 36signals.S:u=
nknown use of instruction mnemonic without a size suffix::31 232::  mov x1,=
 x21:2error:  error: ^:  mov x0, x23:unknown use of instruction mnemonic wi=
thout a size suffix error: signals.S31  2error: ^ signals.S: unknown use of=
 instruction mnemonic without a size suffix:^ error: 37 error:  mov x2, x23=
unknown use of instruction mnemonic without a size suffix error:  :: :3233:=
 error: 2::unknown use of instruction mnemonic without a size suffixerror: =
: 2 2error: invalid instruction mnemonic 'bl' mov x2, x21: :  error:  error=
:  signals.S 2 :^: ^39~error:  error:  bl printfinvalid instruction mnemoni=
c 'bl' ::error: 22: unknown use of instruction mnemonic without a size suff=
ix: error:  error: invalid instruction mnemonic 'bl'signals.S mov x0, x23un=
known use of instruction mnemonic without a size suffix:  error: 51signals.=
S mov x0, x23 bl printf::invalid instruction mnemonic 'bl' :  : error: ^2 b=
l printf^invalid instruction mnemonic 'ldr' ~error:  ldr x0, current  :2sig=
nals.S36: :signals.S:error: 52unknown use of instruction mnemonic without a=
 size suffix::22 36:  mov x1, x20: :error: error:  error:  mov x0, x23 37^u=
nknown use of instruction mnemonic without a size suffix: 2error: :  unknow=
n use of instruction mnemonic without a size suffixerror: ^unknown use of i=
nstruction mnemonic without a size suffix :2: signals.S37: error: ::error: =
56unknown use of instruction mnemonic without a size suffix2signals.Sunknow=
n use of instruction mnemonic without a size suffix: :   mov x8, #15 mov x1=
, x20^:^error:  :signals.S:: 2:: error: 257error: signals.Sunknown use of i=
nstruction mnemonic without a size suffix: :invalid instruction mnemonic 'b=
l':2 error:  : 39unknown use of instruction mnemonic without a size suffix =
mov x2, x21error:  bl memcpy: error: ~^ error:  : : 2error: 2error: invalid=
 instruction mnemonic 'b': :  signals.Sinvalid instruction mnemonic 'bl'err=
or:  b .error: : error:  : : 52error: :error: 2invalid instruction mnemonic=
 'ldr'invalid instruction mnemonic 'ldr'signals.S:  :error:  ldr x0, curren=
t ldr x0, current52unknown use of instruction mnemonic without a size suffi=
x ~52~error:  ~:~unknown use of instruction mnemonic without a size suffix^=
 :  str x23, [x0]error:  :2254: :: 2error: error: signals.S: unknown use of=
 instruction mnemonic without a size suffixunknown use of instruction mnemo=
nic without a size suffix:error:  : :^^error:   error:  unknown use of inst=
ruction mnemonic without a size suffix^signals.Ssignals.S : : error: 56erro=
r: error: unknown token in expression:unknown use of instruction mnemonic w=
ithout a size suffixunknown use of instruction mnemonic without a size suff=
ix signals.S mov x8, #15:  mov sp, x23: mov sp, x23error:  error:  :  :  er=
ror:  error:   unknown token in expressionunknown token in expression   :  =
2  :   error: signals.S  invalid instruction mnemonic 'svc':   ^: error:  ~=
error: invalid instruction mnemonic 'svc'~invalid instruction mnemonic 'svc=
' signals.Serror: 2 :error: 2 svc #0invalid instruction mnemonic 'svc':  er=
ror:  invalid instruction mnemonic 'b' svc #0signals.S^ error: : invalid in=
struction mnemonic 'b'error:  : 2error: : invalid instruction mnemonic 'b'e=
rror:  signals.S:17:2: error: unknown use of instruction mnemonic without a=
 size suffix signals.S:19:2: error: unknown use of instruction mnemonic wit=
hout a size suffix signals.S:20:2: error: unknown use of instruction mnemon=
ic without a size suffix signals.S:21:2: error: unknown use of instruction =
mnemonic without a size suffix signals.S:24:2: error: unknown use of instru=
ction mnemonic without a size suffix signals.S:25:14: error: unknown token =
in expression signals.S:26:14: error: unknown token in expression signals.S=
:27:2: error: unknown use of instruction mnemonic without a size suffix sig=
nals.S:28:2: error: unknown use of instruction mnemonic without a size suff=
ix signals.S:30:10: error: unknown token in expression signals.S:31:2: erro=
r: unknown use of instruction mnemonic without a size suffix signals.S:32:2=
: error: unknown use of instruction mnemonic without a size suffix signals.=
S:33:2: error: invalid instruction mnemonic 'bl' signals.S:36:2: error: unk=
nown use of instruction mnemonic without a size suffix signals.S:37:2: erro=
r: unknown use of instruction mnemonic without a size suffix signals.S:38:2=
: error: unknown use of instruction mnemonic without a size suffix signals.=
S:39:2: error: invalid instruction mnemonic 'bl' signals.S:51:2: error: inv=
alid instruction mnemonic 'ldr' signals.S:52:2: error: unknown use of instr=
uction mnemonic without a size suffix signals.S:54:2: error: unknown use of=
 instruction mnemonic without a size suffix signals.S:56:10: error: unknown=
 token in expression signals.S:57:2: error: invalid instruction mnemonic 's=
vc' signals.S:64:2: error: invalid instruction mnemonic 'b' signals.S:17:2:=
 error: unknown use of instruction mnemonic without a size suffix signals.S=
:19:2: error: unknown use of instruction mnemonic without a size suffix sig=
nals.S:20:2: error: unknown use of instruction mnemonic without a size suff=
ix signals.S:21:2: error: unknown use of instruction mnemonic without a siz=
e suffix signals.S:24:2: error: unknown use of instruction mnemonic without=
 a size suffix signals.S:25:14: error: unknown token in expression signals.=
S:26:14: error: unknown token in expression signals.S:27:2: error: unknown =
use of instruction mnemonic without a size suffix signals.S:28:2: error: un=
known use of instruction mnemonic without a size suffix signals.S:30:10: er=
ror: unknown token in expression signals.S:31:2: error: unknown use of inst=
ruction mnemonic without a size suffix signals.S:32:2: error: unknown use o=
f instruction mnemonic without a size suffix signals.S:33:2: error: invalid=
 instruction mnemonic 'bl' signals.S:36:2: error: unknown use of instructio=
n mnemonic without a size suffix signals.S:37:2: error: unknown use of inst=
ruction mnemonic without a size suffix signals.S:38:2: error: unknown use o=
f instruction mnemonic without a size suffix signals.S:39:2: error: invalid=
 instruction mnemonic 'bl' signals.S:51:2: error: invalid instruction mnemo=
nic 'ldr' signals.S:52:2: error: unknown use of instruction mnemonic withou=
t a size suffix signals.S:54:2: error: unknown use of instruction mnemonic =
without a size suffix signals.S:56:10: error: unknown token in expression s=
ignals.S:57:2: error: invalid instruction mnemonic 'svc' signals.S:64:2: er=
ror: invalid instruction mnemonic 'b' sve_helpers.c:13:18: error: use of un=
declared identifier 'SVE_VQ_MAX' sve_helpers.csve_helpers.c:13:18: error: u=
se of undeclared identifier 'SVE_VQ_MAX' sve_helpers.c:13:18: error: use of=
 undeclared identifier 'SVE_VQ_MAX' :sve_helpers.c13:18: error: use of unde=
clared identifier 'SVE_VQ_MAX' :25:12: error: use of undeclared identifier =
'SVE_VQ_MAX' sve_helpers.c:25:12: error: use of undeclared identifier 'SVE_=
VQ_MAX' sve_helpers.c:25:12: error: use of undeclared identifier 'SVE_VQ_MA=
X' sve_helpers.c:41:12: error: sve_helpers.c:41:12: error: call to undeclar=
ed function 'sve_vq_from_vl'; ISO C99 and later do not support implicit fun=
ction declarations [-Wimplicit-function-declaration] sve_helpers.c:41:12: e=
rror: call to undeclared function 'sve_vq_from_vl'; ISO C99 and later do no=
t support implicit function declarations [-Wimplicit-function-declaration] =
sve_helpers.c:41:12: error: call to undeclared function 'sve_vq_from_vl'; I=
SO C99 and later do not support implicit function declarations [-Wimplicit-=
function-declaration] sve_helpers.c:13:18: error: use of undeclared identif=
ier 'SVE_VQ_MAX' sve_helpers.c:25:12: error: use of undeclared identifier '=
SVE_VQ_MAX' sve_helpers.c:41:12: error: call to undeclared function 'sve_vq=
_from_vl'; ISO C99 and later do not support implicit function declarations =
[-Wimplicit-function-declaration] in testcases/fake_sigreturn_missing_fpsim=
d (Makefile:31) [logspec:kbuild,kbuild.other]
  First seen: 2026-04-01 16:37:57.601153+00:00
  Culprit: code
- Issue: maestro:d166940bcec52a85c09cac77aa3770239f1f22ee | version: 1
  Build: maestro:69cd37eddcae953c056b5321
  Comment:  fatal error: :'asm/hwcap.h' file not found :./test_signals.h15:=
:1510::         10 151515:fatal error:  |  |  |  'asm/hwcap.h' file not fou=
nd###fatal error:  ./test_signals.h:15:10: fatal error: 'asm/hwcap.h' file =
not found ./test_signals.h:15:10: fatal error: 'asm/hwcap.h' file not found=
 ./test_signals.h:15:10: fatal error: 'asm/hwcap.h' file not found ./test_s=
ignals.h:15:10: fatal error: 'asm/hwcap.h' file not found ./test_signals.h:=
15:10: fatal error: 'asm/hwcap.h' file not found ./test_signals.h:15:10: fa=
tal error: 'asm/hwcap.h' file not found ./test_signals.h:15:10: fatal error=
: 'asm/hwcap.h' file not found ./test_signals.h:15:10: fatal error: 'asm/hw=
cap.h' file not found ./test_signals.h:15:10: fatal error: 'asm/hwcap.h' fi=
le not found ./test_signals.h:15:10: fatal error: 'asm/hwcap.h' file not fo=
und ./test_signals.h:15:10: fatal error: 'asm/hwcap.h' file not found ./tes=
t_signals.h:15:10: fatal error: 'asm/hwcap.h' file not found ./test_signals=
.h:15:10: fatal error: 'asm/hwcap.h' file not found ./test_signals.h:15:10:=
 fatal error: 'asm/hwcap.h' file not found ./test_signals.h:15:10: fatal er=
ror: 'asm/hwcap.h' file not found ./test_signals.h:15:10: fatal error: 'asm=
/hwcap.h' file not found ./test_signals.h:15:10: fatal error: 'asm/hwcap.h'=
 file not found ./test_signals.h:15:10: fatal error: 'asm/hwcap.h' file not=
 found ./test_signals.h:15:10: fatal error: 'asm/hwcap.h' file not found /u=
sr/include/x86_64-linux-gnu/asm/sigcontext.h:/usr/include/x86_64-linux-gnu/=
asm/sigcontext.h8:::40 40:error: :88:redefinition of '_fpx_sw_bytes':  85In=
 file included from :testcases/testcases.h8: error: redefinition of '_fpreg=
' :85:/usr/include/x86_64-linux-gnu/bits/sigcontext.h8::40 :error: 8:redefi=
nition of '_fpreg'  8      :|         ^error: : error: redefinition of '_fp=
reg' 91:8   /usr/include/x86_64-linux-gnu/bits/sigcontext.h46:: |  40serror=
: :tredefinition of '_fpxreg'8r 8      :|         ^error:  error: In file i=
ncluded from       redefinition of '_fpxreg'testcases/testcases.c|  /usr/in=
clude/x86_64-linux-gnu/asm/sigcontext.h:98:8: error: redefinition of '_xmmr=
eg' /usr/include/x86_64-linux-gnu/asm/sigcontext.h:180:8: error: redefiniti=
on of '_ymmh_state' /usr/include/x86_64-linux-gnu/asm/sigcontext.h:192:8: e=
rror: redefinition of '_xstate' /usr/include/x86_64-linux-gnu/asm/sigcontex=
t.h:180:8: error: redefinition of '_ymmh_state' /usr/include/x86_64-linux-g=
nu/asm/sigcontext.h:192:8: error: redefinition of '_xstate' /usr/include/x8=
6_64-linux-gnu/asm/sigcontext.h:317:8: error: redefinition of 'sigcontext' =
/usr/include/x86_64-linux-gnu/asm/sigcontext.h:317:8: error: redefinition o=
f 'sigcontext' testcases/testcases.h:101:25: error: invalid application of =
'sizeof' to an incomplete type 'struct _aarch64_ctx' testcases/testcases.h:=
104:27: error: invalid application of 'sizeof' to an incomplete type 'struc=
t _aarch64_ctx' : error: redefinition of '_fpreg' testcases/testcases.h/usr=
/include/x86_64-linux-gnu/bits/sigcontext.h::10540::138::  error: note: inc=
omplete definition of type 'struct _aarch64_ctx'previous definition is here=
 8: error: redefinition of '_fpxreg' a/usr/include/x86_64-linux-gnu/asm/sig=
context.h/usr/include/x86_64-linux-gnu/asm/sigcontext.hd::e4098r::(88s::t  =
error: rerror: redefinition of '_fpx_sw_bytes'uredefinition of '_xmmreg' a9=
8testcases/testcases.ha | :rs101ct:hr25   6u:404c  | _tserror: c tinvalid a=
pplication of 'sizeof' to an incomplete type 'struct _aarch64_ctx'tr_ t37r:=
u cerror: t   incomplete definition of type 'struct _aarch64_ctx' 28_ nt/us=
r/include/x86_64-linux-gnu/asm/sigcontext.hex:  180s*tg:re8ut:c_ therror: e=
 redefinition of '_ymmh_state'a_ u ierror: n  redefinition of '_fpreg't184 =
error: :incomplete definition of type 'struct _aarch64_ctx'27 :/usr/include=
/x86_64-linux-gnu/bits/sigcontext.h :error: 40invalid application of 'sizeo=
f' to an incomplete type 'struct _aarch64_ctx':   sf 8In file included from=
 is:_testcases/testcases.h z f:<eerror: 15=3D;redefinition of '_xstate'p: /=
usr/include/x86_64-linux-gnu/bits/sigcontext.h_testcases/testcases.h/usr/in=
clude/x86_64-linux-gnu/asm/sigcontext.h:a:s:t18928t91i:::ac288t :::ei   not=
e:  nnote: expanded from macro 'HDR_SZ'error: {l error: tIn file included f=
rom redefinition of '_xstate'xtestcases/testcases.h e192/usr/include/x86_64=
-linux-gnu/asm/sigcontext.ht | :_s98ht:e8ra:ud ceerror: trredefinition of '=
_xmmreg' ( _ xerror: mincomplete definition of type 'struct _aarch64_ctx'm =
testcases/testcases.h        :        105h:e13a:d  error: =3Dincomplete def=
inition of type 'struct _aarch64_ctx'  317(:(8c:h aerror: rredefinition of =
'sigcontext'     :d -error: >testcases/testcases.hredefinition of 'sigconte=
xt'/usr/include/x86_64-linux-gnu/bits/sigcontext.hm:: 109a184:g:10i8:c: ) e=
rror:   note:  incomplete definition of type 'struct _aarch64_ctx'317previo=
us definition is here{ t_ /usr/include/x86_64-linux-gnu/asm/sigcontext.ht_ =
:am192aa:rg8cih:c6 ,4error:  15: error: incomplete definition of type 'stru=
ct _aarch64_ctx'/usr/include/x86_64-linux-gnu/bits/sigcontext.h testcases/t=
estcases.h:107:10: error: incomplete definition of type 'struct _aarch64_ct=
x' testcases/testcases.h:  129107: | 7        :         herror: eincomplete=
 definition of type 'struct _aarch64_ctx'a Xctestcases/testcases.hT _:i101H=
n:ElA25iD:n( eherror:  einvalid application of 'sizeof' to an incomplete ty=
pe 'struct _aarch64_ctx'sa 95:testcases/testcases.h:8:2295:::    22error: n=
ote: 130:redefinition of 'sigcontext'forward declaration of 'struct _aarch6=
4_ctx' |   testcases/testcases.h:104:27: error: invalid application of 'siz=
eof' to an incomplete type 'struct _aarch64_ctx' testcases/testcases.h:105:=
13: error: incomplete definition of type 'struct _aarch64_ctx' d-testcases/=
testcases.h>:m101a:g25i:c )error:  invalid application of 'sizeof' to an in=
complete type 'struct _aarch64_ctx'{ struct _aarch64_ctx *get_headetestcase=
s/testcases.hr:(105s:t37r:u cerror: t incomplete definition of type 'struct=
 _aarch64_ctx'_ t xu i*testcases/testcases.hnh:te1053a:d213,_    : t9 u  | =
error: imbincomplete definition of type 'struct _aarch64_ctx'nao error: 22 =
     invalid application of 'sizeof' to an incomplete type 'struct _aarch64=
_ctx':|  :s      a | ta                                              ~~~^er=
ror: ra tsxt a*thieca testcases/testcases.cid:n,l18 i:un34ietestcases/testc=
ases.h:n : ts105error: t3:incomplete definition of type 'struct extra_conte=
xt'2r13 _:ut c error: tmincomplete definition of type 'struct _aarch64_ctx'=
 a :ha egerror: aiincomplete definition of type 'struct _aarch64_ctx'd =3D:=
 7bmtestcases/testcases.h:o:a 95ogerror: :li22incomplete definition of type=
 'struct _aarch64_ctx' c: gu95aec | atts_r thc_aeahaat6dri4ecc_rh (c6si4tt_=
nxrcl uticx*tn h *eetestcases/testcases.c_g aa:esdat18t,r_:r hc34uueh:cai6 =
dtn4error: e tincomplete definition of type 'struct extra_context'r__ t_a: =
Ha37mEraA:gDc i(error: h&cincomplete definition of type 'struct _aarch64_ct=
x'e6, im: caerror: ,gincomplete definition of type 'struct _aarch64_ctx' c7=
,!t:  t utestcases/testcases.h_eerror: i:arnincomplete definition of type '=
struct _aarch64_ctx'a85mt error: ttincomplete definition of type 'struct _a=
arch64_ctx'testcases/testcases.cr  2fatal error: x__ ctoo many errors emitt=
ed, stopping now [-ferror-limit=3D]t*t a10:g testcases/testcases.hierror: :=
cincomplete definition of type 'struct _aarch64_ctx'95, 109 |         if ( =
  h95e | asdta-t>imca giinc line struct _aarch64_ctx *get_headetestcases/te=
stcases.hr(:s107t:r10uc:t  error: _incomplete definition of type 'struct _a=
arch64_ctx'a testcases/testcases.c:18:34: error: incomplete definition of t=
ype 'struct extra_context' date_ex   t95r | as_tatic incloinntee xstt(rsutc=
rtu _cata recxht6r4testcases/testcases.ca_:_c18ct:ox34n :t *eerror: gxincom=
plete definition of type 'struct extra_context'et testcases/testcases.c19::=
:9 :36error: :incomplete definition of type 'struct _aarch64_ctx'7  /usr/in=
clude/x86_64-linux-gnu/asm/sigcontext.h   :19    40 | 9: |         8bi:of o=
 error: l(redefinition of '_fpx_sw_bytes' ! :t       r| error: u       ^inc=
omplete definition of type 'struct extra_context'c 85_:c8t:testcases/testca=
ses.c x:error:  9redefinition of '_fpreg'*: 129te:x7   t:40( |  fatal error=
: sserror: tttoo many errors emitted, stopping now [-ferror-limit=3D]incomp=
lete definition of type 'struct _aarch64_ctx'rr 8: error: redefinition of '=
_fpxreg' i:c8 :i nerror: lredefinition of '_xmmreg'i ne s   t98r | uscttr u=
_catatestcases/testcases.h r:_c130xh:m67m4:r_ ecerror: gtincomplete definit=
ion of type 'struct _aarch64_ctx' x c inline sfatal error: ttoo many errors=
 emitted, stopping now [-ferror-limit=3D]r r/usr/include/x86_64-linux-gnu/a=
sm/sigcontext.ha:_180c:o8n:t eerror: xredefinition of '_ymmh_state't /usr/i=
nclude/x86_64-linux-gnu/asm/sigcontext.h:192:8: error: redefinition of '_xs=
tate' testcases/testcases.c:18:34: error: incomplete definition of type 'st=
ruct extra_context' c/usr/include/x86_64-linux-gnu/asm/sigcontext.ho:n317t:=
e8x:t (error: sredefinition of 'sigcontext't error: incomplete definition o=
f type 'struct extra_context' testcases/testcases.h:101:25: error: invalid =
application of 'sizeof' to an incomplete type 'struct _aarch64_ctx' c inl  =
 i95n | es tsattriucc ti n_laianrec hs6t4r_uccttx  _*agaertestcases/testcas=
es.cct:h_196h:4e19_a:cde trerror: x( sincomplete definition of type 'struct=
 _aarch64_ctx't* testcases/testcases.h:testcases/testcases.h105::1395:: 22e=
rror: :incomplete definition of type 'struct _aarch64_ctx'  raudcetr (esxtt=
rruac_tcon fatal error: t_too many errors emitted, stopping now [-ferror-li=
mit=3D]ea testcases/testcases.h:105:37: error: incomplete definition of typ=
e 'struct _aarch64_ctx' testcases/testcases.h:106:testcases/testcases.c15::=
 18error: :incomplete definition of type 'struct _aarch64_ctx'34 : error: i=
ncomplete definition of type 'struct extra_context'   testcases/testcases.c=
:18:34: error: incomplete definition of type 'struct extra_context' GET_RES=
V_testcases/testcases.hN:EX107T:_10H:E Aerror: D(incomplete definition of t=
ype 'struct _aarch64_ctx'& :95  | error: sincomplete definition of type 'st=
ruct _aarch64_ctx't line struct _aarch64_ctx *get_header(struct _atestcases=
/testcases.har:c109h:6104:_ cerror: tincomplete definition of type 'struct =
_aarch64_ctx'x fatal error: testcases/testcases.htoo many errors emitted, s=
topping now [-ferror-limit=3D]: testcases/testcases.h:129:7: error: incompl=
ete definition of type 'struct _aarch64_ctx' testcases/testcases.h:130:7: e=
rror: incomplete definition of type 'struct _aarch64_ctx' testcases/testcas=
es.c:18:34: error: incomplete definition of type 'struct extra_context' tes=
tcases/testcases.c:18:34: error: incomplete definition of type 'struct extr=
a_context' testcases/testcases.c:19:19: error: incomplete definition of typ=
e 'struct _aarch64_ctx' fatal error: too many errors emitted, stopping now =
[-ferror-limit=3D] /usr/include/x86_64-linux-gnu/asm/sigcontext.h:40:8: err=
or: redefinition of '_fpx_sw_bytes' /usr/include/x86_64-linux-gnu/asm/sigco=
ntext.h:85:8: error: redefinition of '_fpreg' /usr/include/x86_64-linux-gnu=
/asm/sigcontext.h:91:8: error: redefinition of '_fpxreg' /usr/include/x86_6=
4-linux-gnu/asm/sigcontext.h:98:8: error: redefinition of '_xmmreg' /usr/in=
clude/x86_64-linux-gnu/asm/sigcontext.h:180:8: error: redefinition of '_ymm=
h_state' /usr/include/x86_64-linux-gnu/asm/sigcontext.h:192:8: error: redef=
inition of '_xstate' /usr/include/x86_64-linux-gnu/asm/sigcontext.h:317:8: =
error: redefinition of 'sigcontext' testcases/testcases.h:101:25: error: in=
valid application of 'sizeof' to an incomplete type 'struct _aarch64_ctx' t=
estcases/testcases.h:104:27: error: invalid application of 'sizeof' to an i=
ncomplete type 'struct _aarch64_ctx' testcases/testcases.h:105:13: error: i=
ncomplete definition of type 'struct _aarch64_ctx' testcases/testcases.h:10=
5:37: error: incomplete definition of type 'struct _aarch64_ctx' testcases/=
testcases.h:106:15: error: incomplete definition of type 'struct _aarch64_c=
tx' testcases/testcases.h:107:10: error: incomplete definition of type 'str=
uct _aarch64_ctx' testcases/testcases.h:109:10: error: incomplete definitio=
n of type 'struct _aarch64_ctx' testcases/testcases.h:129:7: error: incompl=
ete definition of type 'struct _aarch64_ctx' testcases/testcases.h:130:7: e=
rror: incomplete definition of type 'struct _aarch64_ctx' testcases/testcas=
es.c:18:34: error: incomplete definition of type 'struct extra_context' tes=
tcases/testcases.c:18:34: error: incomplete definition of type 'struct extr=
a_context' testcases/testcases.c:19:19: error: incomplete definition of typ=
e 'struct _aarch64_ctx' fatal error: too many errors emitted, stopping now =
[-ferror-limit=3D] /usr/include/x86_64-linux-gnu/asm/sigcontext.h:40:8: err=
or: redefinition of '_fpx_sw_bytes' /usr/include/x86_64-linux-gnu/asm/sigco=
ntext.h:85:8: error: redefinition of '_fpreg' /usr/include/x86_64-linux-gnu=
/asm/sigcontext.h:91:8: error: redefinition of '_fpxreg' /usr/include/x86_6=
4-linux-gnu/asm/sigcontext.h:98:8: error: redefinition of '_xmmreg' /usr/in=
clude/x86_64-linux-gnu/asm/sigcontext.h:180:8: error: redefinition of '_ymm=
h_state' /usr/include/x86_64-linux-gnu/asm/sigcontext.h:192:8: error: redef=
inition of '_xstate' /usr/include/x86_64-linux-gnu/asm/sigcontext.h:317:8: =
error: redefinition of 'sigcontext' testcases/testcases.h:101:25: error: in=
valid application of 'sizeof' to an incomplete type 'struct _aarch64_ctx' t=
estcases/testcases.h:104:27: error: invalid application of 'sizeof' to an i=
ncomplete type 'struct _aarch64_ctx' testcases/testcases.h:105:13: error: i=
ncomplete definition of type 'struct _aarch64_ctx' testcases/testcases.h:10=
5:37: error: incomplete definition of type 'struct _aarch64_ctx' testcases/=
testcases.h:106:15: error: incomplete definition of type 'struct _aarch64_c=
tx' testcases/testcases.h:107:10: error: incomplete definition of type 'str=
uct _aarch64_ctx' testcases/testcases.h:109:10: error: incomplete definitio=
n of type 'struct _aarch64_ctx' testcases/testcases.h:129:7: error: incompl=
ete definition of type 'struct _aarch64_ctx' testcases/testcases.h:130:7: e=
rror: incomplete definition of type 'struct _aarch64_ctx' testcases/testcas=
es.c:18:34: error: incomplete definition of type 'struct extra_context' tes=
tcases/testcases.c:18:34: error: incomplete definition of type 'struct extr=
a_context' testcases/testcases.c:19:19: error: incomplete definition of typ=
e 'struct _aarch64_ctx' fatal error: too many errors emitted, stopping now =
[-ferror-limit=3D] signals.S:16:19: error: expected ']' in brackets express=
ion signals.S:16:19: error: expected ']' in brackets expression signals.S:1=
6:19: error: expected ']' in brackets expression signals.Ssignals.S::1717::=
22: : error: error: unknown use of instruction mnemonic without a size suff=
ixunknown use of instruction mnemonic without a size suffix signals.S:signa=
ls.S19::192:: 2error: : unknown use of instruction mnemonic without a size =
suffixerror:  signals.Ssignals.S::2020::22: : error: error: unknown use of =
instruction mnemonic without a size suffixunknown use of instruction mnemon=
ic without a size suffix signals.Ssignals.S:21::212:: 2error: : unknown use=
 of instruction mnemonic without a size suffixerror:  signals.S:24:2: error=
: unknown use of instruction mnemonic without a size suffix signals.S:25:14=
: error: unknown token in expression signals.S:26:14: error: unknown token =
in expression signals.S:27:2: error: unknown use of instruction mnemonic wi=
thout a size suffix signals.S:28:2: error: unknown use of instruction mnemo=
nic without a size suffix signals.S:30:10: error: unknown token in expressi=
on signals.S:31:2: error: unknown use of instruction mnemonic without a siz=
e suffix signals.S:32:2: error: unknown use of instruction mnemonic without=
 a size suffix signals.S:33:2: error: invalid instruction mnemonic 'bl' sig=
nals.S:36:2: error: unknown use of instruction mnemonic without a size suff=
ix signals.S:37:2: error: unknown use of instruction mnemonic without a siz=
e suffix signals.S:38:2: error: unknown use of instruction mnemonic without=
 a size suffix signals.S:39:2: error: invalid instruction mnemonic 'bl' sig=
nals.S:51:2: error: invalid instruction mnemonic 'ldr' signals.S:52:2: erro=
r: unknown use of instruction mnemonic without a size suffix signals.S:54:2=
: error: unknown use of instruction mnemonic without a size suffix signals.=
S:56:10: error: unknown token in expression signals.S:16:signals.S19:: 57er=
ror: :expected ']' in brackets expression2 : error: invalid instruction mne=
monic 'svc' stp x29, x30, [sp, #-16]! signals.S:17:2: error: unknown use of=
 instruction mnemonic without a size suffix signals.S:19:2: error: unknown =
use of instruction mnemonic without a size suffix signals.S:20:2: error: un=
known use of instruction mnemonic without a size suffix signals.S:21:2: err=
or: unknown use of instruction mnemonic without a size suffix signals.S:24:=
2: error: unknown use of instruction mnemonic without a size suffix signals=
.S:25:14: error: unknown token in expression signals.S:26:14: error: unknow=
n token in expression signals.S:27:2: error: unknown use of instruction mne=
monic without a size suffix signals.S:28:2: error: unknown use of instructi=
on mnemonic without a size suffix signals.S:30:10: error: unknown token in =
expression signals.S:31:2: error: unknown use of instruction mnemonic witho=
ut a size suffix signals.S:32:2: error: unknown use of instruction mnemonic=
 without a size suffix signals.S:33:2: error: invalid instruction mnemonic =
'bl' signals.S:36:2: error: unknown use of instruction mnemonic without a s=
ize suffix signals.S:37:2: error: unknown use of instruction mnemonic witho=
ut a size suffix signals.S:38:2: error: unknown use of instruction mnemonic=
 without a size suffix signals.S:39:2: error: invalid instruction mnemonic =
'bl' signals.S:51:2: error: invalid instruction mnemonic 'ldr' signals.S:52=
:2: error: unknown use of instruction mnemonic without a size suffix signal=
s.S:54:2: error: unknown use of instruction mnemonic without a size suffix =
signals.S:56:10: error: unknown token in expression signals.S:57:2: error: =
invalid instruction mnemonic 'svc' signals.S:64:2: error: invalid instructi=
on mnemonic 'b' signals.S:17:2: error: unknown use of instruction mnemonic =
without a size suffix signals.S:19:2: error: unknown use of instruction mne=
monic without a size suffix signals.S:20:2: error: unknown use of instructi=
on mnemonic without a size suffix signals.S:21:2: error: unknown use of ins=
truction mnemonic without a size suffix signals.S:24:2: error: unknown use =
of instruction mnemonic without a size suffix signals.S:25:14: error: unkno=
wn token in expression signals.S:26:14: error: unknown token in expression =
signals.S:24:2: error: unknown use of instruction mnemonic without a size s=
uffix signals.S:27:2: error: unknown use of instruction mnemonic without a =
size suffixsignals.S error: unknown token in expression :2: error: unknown =
use of instruction mnemonic without a size suffix 14: error: unknown token =
in expression : 30 : 10 :  error:  unknown token in expression  signals.S:3=
1:2: error: unknown use of instruction mnemonic without a size suffix : err=
or: unknown use of instruction mnemonic without a size suffix signals.S:32:=
2: error: unknown use of instruction mnemonic without a size suffix signals=
.S:28:2: error: unknown use of instruction mnemonic without a size suffix :=
2: error: invalid instruction mnemonic 'bl' error: unknown token in express=
ion signals.Ssignals.S:31:2: error: unknown use of instruction mnemonic wit=
hout a size suffix signals.S:32:2: error: unknown use of instruction mnemon=
ic without a size suffix signals.S:33:2: error: invalid instruction mnemoni=
c 'bl' signals.S:36:2: error: unknown use of instruction mnemonic without a=
 size suffix signals.S:37:2: error: unknown use of instruction mnemonic wit=
hout a size suffix signals.S:38:2: error: unknown use of instruction mnemon=
ic without a size suffix signals.S:39:2: error: invalid instruction mnemoni=
c 'bl' signals.S:51:2: error: invalid instruction mnemonic 'ldr' signals.S:=
52:2: error: unknown use of instruction mnemonic without a size suffix sign=
als.S:54:2: error: unknown use of instruction mnemonic without a size suffi=
x signals.S:56:10: error: unknown token in expression signals.S:57:2: error=
: invalid instruction mnemonic 'svc' signals.S:64:2: error: invalid instruc=
tion mnemonic 'b' :36:2: error: unknown use of instruction mnemonic without=
 a size suffix signals.S:37:2: error: unknown use of instruction mnemonic w=
ithout a size suffix signals.S:38:2: error: unknown use of instruction mnem=
onic without a size suffix signals.S:39:2: error: invalid instruction mnemo=
nic 'bl' signals.S:51:2: error: invalid instruction mnemonic 'ldr' signals.=
S:52:2: error: unknown use of instruction mnemonic without a size suffix si=
gnals.S:54:2: error: unknown use of instruction mnemonic without a size suf=
fix signals.S:56:10: error: unknown token in expression signals.S:57:2: err=
or: invalid instruction mnemonic 'svc' signals.S:64:2: error: invalid instr=
uction mnemonic 'b' signals.S:16:19: error: expected ']' in brackets expres=
sion signals.S:17:2: error: unknown use of instruction mnemonic without a s=
ize suffix signals.S:19:2: error: unknown use of instruction mnemonic witho=
ut a size suffix signals.S:20:2: error: unknown use of instruction mnemonic=
 without a size suffix signals.S:21:2: error: unknown use of instruction mn=
emonic without a size suffix signals.S:24:2: error: unknown use of instruct=
ion mnemonic without a size suffix signals.S:25:14: error: unknown token in=
 expression signals.S:26:14: error: unknown token in expression signals.S:2=
7:2: error: unknown use of instruction mnemonic without a size suffix signa=
ls.S:28:2: error: unknown use of instruction mnemonic without a size suffix=
 signals.S:30:10: error: unknown token in expression signals.S:31:2: error:=
 unknown use of instruction mnemonic without a size suffix signals.S:32:2: =
error: unknown use of instruction mnemonic without a size suffix signals.S:=
33:2: error: invalid instruction mnemonic 'bl' signals.S:36:2: error: unkno=
wn use of instruction mnemonic without a size suffix signals.S:37:2: error:=
 unknown use of instruction mnemonic without a size suffix signals.S:38:2: =
error: unknown use of instruction mnemonic without a size suffix signals.S:=
39:2: error: invalid instruction mnemonic 'bl' signals.S:51:2: error: inval=
id instruction mnemonic 'ldr' signals.S:52:2: error: unknown use of instruc=
tion mnemonic without a size suffix signals.S:54:2: error: unknown use of i=
nstruction mnemonic without a size suffix signals.S:56:10: error: unknown t=
oken in expression signals.S:57:2: error: invalid instruction mnemonic 'svc=
' signals.S:64:2: error: invalid instruction mnemonic 'b' signals.S:16:19: =
error: expected ']' in brackets expression signals.S:17:2: error: unknown u=
se of instruction mnemonic without a size suffix signals.S:19:2: error: unk=
nown use of instruction mnemonic without a size suffix signals.S:20:2: erro=
r: unknown use of instruction mnemonic without a size suffix signals.S:21:2=
: error: unknown use of instruction mnemonic without a size suffix signals.=
S:24:2: error: unknown use of instruction mnemonic without a size suffix si=
gnals.S:25:14: error: unknown token in expression signals.S:26:14: error: u=
nknown token in expression signals.S:27:2: error: unknown use of instructio=
n mnemonic without a size suffix signals.S:28:2: error: unknown use of inst=
ruction mnemonic without a size suffix signals.S:30:10: error: unknown toke=
n in expression signals.S:31:2: error: unknown use of instruction mnemonic =
without a size suffix signals.S:32:2: error: unknown use of instruction mne=
monic without a size suffix signals.S:33:2: error: invalid instruction mnem=
onic 'bl' signals.S:36:2: error: unknown use of instruction mnemonic withou=
t a size suffix signals.S:37:2: error: unknown use of instruction mnemonic =
without a size suffix signals.S:38:2: error: unknown use of instruction mne=
monic without a size suffix signals.S:39:2: error: invalid instruction mnem=
onic 'bl' signals.S:51:2: error: invalid instruction mnemonic 'ldr' signals=
.S:52:2: error: unknown use of instruction mnemonic without a size suffix s=
ignals.S:54:2: error: unknown use of instruction mnemonic without a size su=
ffix signals.S:56:10: error: unknown token in expression signals.S:57:2: er=
ror: invalid instruction mnemonic 'svc' signals.S:64:2: error: invalid inst=
ruction mnemonic 'b' signals.S:16:19: error: expected ']' in brackets expre=
ssion signals.S:17:2: error: unknown use of instruction mnemonic without a =
size suffix signals.S:19:2: error: unknown use of instruction mnemonic with=
out a size suffix signals.S:20:2: error: unknown use of instruction mnemoni=
c without a size suffix signals.S:21:2: error: unknown use of instruction m=
nemonic without a size suffix signals.S:24:2: error: unknown use of instruc=
tion mnemonic without a size suffix signals.S:25:14: error: unknown token i=
n expression signals.S:26:14: error: unknown token in expression signals.S:=
27:2: error: unknown use of instruction mnemonic without a size suffix sign=
als.S:28:2: error: unknown use of instruction mnemonic without a size suffi=
x signals.S:30:10: error: unknown token in expression signals.S:31:2: error=
: unknown use of instruction mnemonic without a size suffix signals.S:32:2:=
 error: unknown use of instruction mnemonic without a size suffix signals.S=
:33:2: error: invalid instruction mnemonic 'bl' signals.S:36:2: error: unkn=
own use of instruction mnemonic without a size suffix signals.S:37:2: error=
: unknown use of instruction mnemonic without a size suffix signals.S:38:2:=
 error: unknown use of instruction mnemonic without a size suffix signals.S=
:39:2: error: invalid instruction mnemonic 'bl' signals.S:51:2: error: inva=
lid instruction mnemonic 'ldr' signals.S:52:2: error: unknown use of instru=
ction mnemonic without a size suffix signals.S:54:2: error: unknown use of =
instruction mnemonic without a size suffix signals.S:56:10: error: unknown =
token in expression signals.S:57:2: error: invalid instruction mnemonic 'sv=
c' signals.S:64:2: error: invalid instruction mnemonic 'b' signals.S:16:19:=
 error: expected ']' in brackets expression signals.S:17:2: error: unknown =
use of instruction mnemonic without a size suffix signals.S:19:2: error: un=
known use of instruction mnemonic without a size suffix signals.S:20:2: err=
or: unknown use of instruction mnemonic without a size suffix signals.S:21:=
2: error: unknown use of instruction mnemonic without a size suffix signals=
.S:24:2: error: unknown use of instruction mnemonic without a size suffix s=
ignals.S:25:14: error: unknown token in expression signals.S:26:14: error: =
unknown token in expression signals.S:27:2: error: unknown use of instructi=
on mnemonic without a size suffix signals.S:28:2: error: unknown use of ins=
truction mnemonic without a size suffix signals.S:30:10: error: unknown tok=
en in expression signals.S:31:2: error: unknown use of instruction mnemonic=
 without a size suffix signals.S:32:2: error: unknown use of instruction mn=
emonic without a size suffix signals.S:33:2: error: invalid instruction mne=
monic 'bl' signals.S:36:2: error: unknown use of instruction mnemonic witho=
ut a size suffix signals.S:37:2: error: unknown use of instruction mnemonic=
 without a size suffix signals.S:38:2: error: unknown use of instruction mn=
emonic without a size suffix signals.S:39:2: error: invalid instruction mne=
monic 'bl' signals.S:51:2: error: invalid instruction mnemonic 'ldr' signal=
s.S:52:2: error: unknown use of instruction mnemonic without a size suffix =
signals.S:54:2: error: unknown use of instruction mnemonic without a size s=
uffix signals.S:56:10: error: unknown token in expression signals.S:57:2: e=
rror: invalid instruction mnemonic 'svc' signals.S:64:2: error: invalid ins=
truction mnemonic 'b' sve_helpers.c:13:18: error: use of undeclared identif=
ier 'SVE_VQ_MAX' sve_helpers.c:13:18: error: use of undeclared identifier '=
SVE_VQ_MAX' sve_helpers.c:13:18: error: use of undeclared identifier 'SVE_V=
Q_MAX' sve_helpers.c:25:12: error: use of undeclared identifier 'SVE_VQ_MAX=
' sve_helpers.c:25:12: error: use of undeclared identifier 'SVE_VQ_MAX' sve=
_helpers.c:25:12: error: use of undeclared identifier 'SVE_VQ_MAX' : error:=
 use of undeclared identifier 'SVE_VQ_MAX' sve_helpers.csve_helpers.c:41:12=
: error: call to undeclared function 'sve_vq_from_vl'; ISO C99 and later do=
 not support implicit function declarations [-Wimplicit-function-declaratio=
n] :25:12: error: use of undeclared identifier 'SVE_VQ_MAX' :41:12: error: =
sve_helpers.c:41:12: error: call to undeclared function 'sve_vq_from_vl'; I=
SO C99 and later do not support implicit function declarations [-Wimplicit-=
function-declaration]call to undeclared function 'sve_vq_from_vl'; ISO C99 =
and later do not support implicit function declarations [-Wimplicit-functio=
n-declaration] sve_helpers.c:41:12: error: call to undeclared function 'sve=
_vq_from_vl'; ISO C99 and later do not support implicit function declaratio=
ns [-Wimplicit-function-declaration] sve_helpers.c:13:18: error: use of und=
eclared identifier 'SVE_VQ_MAX' in testcases/fake_sigreturn_bad_magic (Make=
file:31) [logspec:kbuild,kbuild.other]
  First seen: 2026-04-01 16:50:31.105367+00:00
  Culprit: code
- Issue: maestro:813995b419d351e54e42e134b324abd91da5cf11 | version: 1
  Build: maestro:69cd386ddcae953c056b53c7
  Comment:  in testcases/fake_sigreturn_sve_change_vl (Makefile:31) [logspe=
c:kbuild,kbuild.other]
  First seen: 2026-04-01 17:04:10.865294+00:00
  Culprit: code
- Issue: maestro:c8166ec266c9f21b9901ef8c8c40af93cf32eeb0 | version: 1
  Build: maestro:69cd3882dcae953c056b53e1
  Comment:  =E2=80=98PR_GET_SHADOW_STACK_STATUS=E2=80=99 undeclared (first =
use in this function) in testcases/gcs_frame (testcases/gcs_frame.c) [logsp=
ec:kbuild,kbuild.compiler.error]
  First seen: 2026-04-01 17:17:47.437494+00:00
  Culprit: code
- Issue: maestro:8cc57e5821deb5227525147cda7a7e53246e10c3 | version: 1
  Build: maestro:69cd37f1dcae953c056b5324
  Comment:  15:./test_signals.h :testcases/fake_sigreturn_bad_magic.c:fatal=
 error: In file included from  :'asm/hwcap.h' file not found./test_signals_=
utils.hfatal error: in testcases/fake_sigreturn_bad_size_for_magic0 (Makefi=
le:31) [logspec:kbuild,kbuild.compiler.error]
  First seen: 2026-04-01 17:36:08.113500+00:00
  Culprit: code


This branch has 36 pre-existing build issues. See details in the dashboard.

Sent every day if there were changes in the past 24 hours.
Legend: =E2=9C=85 PASS   =E2=9D=8C FAIL  =E2=9A=A0=EF=B8=8F INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
