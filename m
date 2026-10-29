Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793314848;
	b=EToPMi2xKuzj/QLQalWe0S+KU+UQIyoBp9kJe7Wmn7jrt64yalNP0621lCV8VXNijFI4
	 VSt0qAvK4CIrOJh1VryfF0XZGbYXogCsJrmq5I7Zl7iizQ2IiATvuK6dS0A7Wz71F98/F
	 4F+pk/tc9OodWvrDkkfeMUy05d59qCFyvIj3qA20AZGX3M6YZAGvZuwfjcCpiTVQ2rKaK
	 dU3GtS8qeym0sD+o3q4vgdV+f6hReIwE72f+J62BLG3M3gTbxegNNOEHtSyJGn3OzKEFP
	 9hmDLfolUkdjzeRDzGwQTaLcJQLt3BdN3eq34maI1D1Ck5uezX+HAXLLScsAy7zBfbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793314848;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 X-Relaying-Domain:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=wAkmuO04uLZ+w6vmRTOyMcrwMg7+Yeu0ajM/FtCfLDw=;
	b=ENTqSmNbv2r5fVtAcEaoII2vrobC6NJrFyBGC/JZS9O0TDoHsy4M6KQ+qsdD4mFslG8j
	 tNctQuMEkc9oK6s37EIlyQXZgw0bbd2+/vbJqP9vJLa+AM36mHhLBJDY3OXFNAsA64SML
	 ful6ohYW5i/eF0K5LTy6jt6z1rEPbiQbvVUnDlEUsG5TlivlPQ6qW+FZcryBOx5QTiiBo
	 ACd95c4KkgIs4c9VmwNKKiaQvdfz6aaP5rZ1uDKBo5jb5Mul6xzEYg04r7yyG9MQEo+YA
	 4WszTVJStEyRknKxHXlgkb2ZnrsRYxmS7EdI//9sQHQfNS6GrxT1mGjZAswGOo+R4DQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=everpuredata.com;
	spf=pass smtp.mailfrom=everpuredata.com;
	dkim=pass header.d=everpuredata.com header.i=@everpuredata.com header.a=rsa-sha256 header.s=google header.b=GCbi1D1U;
	arc=none smtp.remote-ip=209.85.214.225
Received: from mail-pl1-f225.google.com (mail-pl1-f225.google.com [209.85.214.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA8AC606A31C
	for <linux-next@vger.kernel.org>; Thu, 29 Oct 2026 23:00:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA8AC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=everpuredata.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everpuredata.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=everpuredata.com header.i=@everpuredata.com header.a=rsa-sha256 header.s=google header.b=GCbi1D1U
Received: by mail-pl1-f225.google.com with SMTP id d9443c01a7336-2e9e53d011eso1165765ad.1
        for <linux-next@vger.kernel.org>; Thu, 29 Oct 2026 16:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=everpuredata.com; s=google; t=1793314846; x=1793919646; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wAkmuO04uLZ+w6vmRTOyMcrwMg7+Yeu0ajM/FtCfLDw=;
        b=GCbi1D1UmJ92ke82TBFSwVWyiHVpUnp9ZTyC42iQ4udcBo2eCz0oMhXae06qQwsX+P
         3oBx8srzu9/J7nk03R0ySyKWycHTO+M3NzGbKv/uVDHnsBdnBDDIz6jnNC9lZK/Pn5Lh
         kRPv/tigWoF2fkhBDWUXfkSxbIlt60RKTEkdqWLw0UQtSJ4xF3CyqYP6ZAqA93PyqUoG
         3HrACz/6h768x1TrrVNUTaxhOo4Ze0zrCpCvaHLAewuGOWwqn7UQll1IgIRsXClhhgZ0
         D1i0NBlWyal5k7cAgRXHqD3BvWWm3BQe3Mcft0g1a+LXnxL41jEA86NxSCFJ1ToF+g7P
         9Acg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793314846; x=1793919646;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wAkmuO04uLZ+w6vmRTOyMcrwMg7+Yeu0ajM/FtCfLDw=;
        b=XIVi0CHtlUgvzPpKKl2gD6RCaekqqwyZ/iaYklp+FLvIC4tCBL9dW38NXg/Gkst6Ar
         FIDUHGNUrPArcg2cJtK8nKj2FI3YdCruEdLiW5OrQhC71EpnGwcN529x56c+U4Zs05Jc
         VPck8Zn/vGGeYzFb8ID5VEBs6QF/9JJw9SxYlMc4qGnJkm7bM/AYtHYZB+OKbMve8rVK
         tP9fqonzYQ/WImgSTiUSaT00CBGeRwXMbC1f6doGP2j0pFgepJpXWSU6A9C2dRDthlbX
         VhgR+eT+kdtP+ItR6xQYrJpNV/OOYioiQ9/Z7ci5bDAapC7RCS/E4roDSVb+Eelu7jaE
         U4tQ==
X-Forwarded-Encrypted: i=1; AKwUvBwjeRai9t9WYIRkG1/BWuQicqgBo7yqQkUMCkTTPnLF7OE5wbO+WsjgISjxEDLwNWeImKvkOOIVFb4D@vger.kernel.org
X-Gm-Message-State: AFq9FYItspmRuTUB7HeblPR/FNaX12DcADSzNhgAHLOXgk6dTGGeC6Es
	/DOdtqudwM8Ca8UF4Wo1IrnKTbxUmOcoUzB8dZjQtNzBZEXI8Fin6Dw72so8/IWURTnhVExd5dZ
	OKtVS3nNDCtbvibkjh6/0Q7gvXEuUPndXHlLI
X-Gm-Gg: AYBFou35hZKobNDiawK+dP5nbZYwf/FwKQFMi09ySqOst0b0bj3qKLAtJJTJDiGGqLR
	1MpTL0L8db9NfP6uc55tnwdAPoHxerGu9ym1aidGp01EHhecmaLZ2YABAC/UqD1Ix2VW3xENGsm
	A5JMQ+iej+rICF9DezhwzpNmikx2xtPtu7HTL8GPzdIQzIjj8Mf3T3yq1ieIYTYXAZIJCr5N3s4
	LnNPq5JHBy3l47Jqvd/SbqPm+IUNceVJY4hsdQhMmWscndOf38ltnJqmXmaCuFZep0msxWYkm+X
	lAEB7tj24tGNQACmS+Aqay2mhdYKc+QmAQJVQukeIUvZr/BH1GVUC/nSudaW/POvW1ub5URlWag
	6KFEoAQetfO1xzpPh6ND6vvDH2QKNcJRIoGsZvLY=
X-Received: by 2002:a17:90b:5827:b0:3ab:be66:ddb7 with SMTP id 98e67ed59e1d1-3ae897bae26mr304143a91.47.1793314845971;
        Thu, 29 Oct 2026 16:00:45 -0700 (PDT)
Received: from c14-smtp-2023.dev.purestorage.com ([208.88.158.129])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ae6e88749csm2871364a91.7.2026.10.29.16.00.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 16:00:45 -0700 (PDT)
X-Relaying-Domain: everpuredata.com
Received: from irdv-tmenninger.dev.purestorage.com (irdv-tmenninger.dev.purestorage.com [10.32.149.15])
	by c14-smtp-2023.dev.purestorage.com (Postfix) with ESMTPS id 22C0E3417A8;
	Thu, 29 Oct 2026 16:00:45 -0700 (PDT)
From: Tim Menninger <tmenninger@everpuredata.com>
To: sashal@kernel.org
Cc: broonie@kernel.org,
	anna@kernel.org,
	anna.schumaker@hammerspace.com,
	trondmy@gmail.com,
	trond.myklebust@hammerspace.com,
	cel@kernel.org,
	ymu@everpuredata.com,
	linux-nfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-next@vger.kernel.org
Subject: Re: [PATCH linux-next] xprtrdma: fix up the nfs/nfs-anna merge of the Write chunk head trim
Date: Thu, 29 Oct 2026 23:00:44 +0000
Message-ID: <20261029230045.1259914-1-tmenninger@everpuredata.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261020161346.3711926-1-sashal@kernel.org>
References: <20261020161346.3711926-1-sashal@kernel.org>
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

I applied this fixup and A/B tested it with my reproducer. Both
configurations pass.

I agree with the merge resolution; keeping the head trimming and
buflen adjustment together in rpcrdma_inline_fixup() makes sense.

Tested-by: Tim Menninger <tmenninger@everpuredata.com>
Reviewed-by: Tim Menninger <tmenninger@everpuredata.com>
