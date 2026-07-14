Received: from fout-b4-smtp.messagingengine.com (fout-b4-smtp.messagingengine.com [202.12.124.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 638E6345CD3;
	Tue, 14 Jul 2026 06:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784011563; cv=none; b=oKtP+PHfDeZQZGcthCai3l5/5p7FPWjfv7nE8Q6mMWZ0MNRtnwTlMUYfAOh/B9iC2HpY0HdxlgisKTXnhCR6KTT+zNKDyn9BDRnW1gkU7GxKaLyWzPYlxxDhGKLp8gPGtYvMypZJaxRGyE6TWT6HgGxEdNcg6zBM4dYgqPidVt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784011563; c=relaxed/simple;
	bh=eVt7OgPwQ5eLlfFv/ro89HRRTZpwDVRj/JIVseEdKfg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WL6wQ9PQo/Y0x3k8WFPvMsqJJddpK9KSQOgWbzG1H6VGJxGD1mVTnnY5HS3pmU5s40d9azV0+uyBeXUzyvxiqxi2g0klQvuSg9xWGt0UspBBIR+5tETObdoO50vVYm1i9kcG/FDxO8ktbfxmFlm3nk089SsFzICRXUSsB7PmfEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=WWyEyV/K; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=H5T2tmJj; arc=none smtp.client-ip=202.12.124.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="WWyEyV/K";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="H5T2tmJj"
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id 80C4F1D00170;
	Tue, 14 Jul 2026 02:46:00 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Tue, 14 Jul 2026 02:46:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1784011560; x=1784097960; bh=fN/TJMqgHO
	2bxJqE4yJvnzrhoFBbs71jwqq0WIvclo8=; b=WWyEyV/Kl/uFARbZreNkJWc8hc
	Cl1u3L9FV+BztprZrmVGxtYFSW1AXppIeuDDFYPjq2YyrjNCVdA2s/PxjwZwI0xh
	YfpnayN3DAPT5C+ouvgd0ilEu4mx/om7dY6EQp7u73E/cekDdCpCaBHB1wLJmR8Z
	stIfBddWB/al5XxqlTOmrytK3VVHVafrJTDNE9f1KJFc+M+oBjzAYQJXgfK1AjJh
	zG9KO3HZI4O9xtNPxUjyVG67E11amhAXxvfeoWYEpgdjgcH2IT7IhODtrBtzLmD7
	RkTGvbm5gleKYvWXocDMlKAP92d6E7fa24z+axIWS6tL2lCbg66fh7zh9QjA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1784011560; x=1784097960; bh=fN/TJMqgHO2bxJqE4yJvnzrhoFBbs71jwqq
	0WIvclo8=; b=H5T2tmJjFv7/Mkwt6bREBb/r4SVNHcvSh2g0YSAodfBg8/kpsyo
	dMkUKPDI8up7rW4zdmlClyE+sBS/z91EXqLB/9CYVSxK5t1FrfXDzcay3p0aWswo
	50ZWpATJnP5PqDlpk+FnQNMyB2ufT12Zigk8xjG/tOLHhnKAbh5YW7QpHvo+gXDs
	yXlPBalNaRO4Jne59oSL7NfWRc/nGV0UKogMOxWRRUmXL9USB3YrutH7bg7OMG0o
	O9C4Rk0ITwQUZbr525ukj5Pzj4CyTz+8AItpoosSCPIp3pot1A5+nXEA95TN/9X4
	K0KpClvqDes/fHAfdAJ3+1yXbfyrwYtA1Zw==
X-ME-Sender: <xms:KNtVagbGFGpcgt14MlI_m9e-NhShxcr4oy-C7Nv8F5wY66aFDmSIWQ>
    <xme:KNtVar1q66ffXavI1m6SpojjpQ2BybLLma0R1NritTRIqU71x5TlizyEJb77kZjFh
    WlC2tJh_Rn2KLAVXvUtbhpofYXOQ-EBV5ZbotEDoop8OUoD>
X-ME-Received: <xmr:KNtVaro8ZRY9KAbLhvs80_Urhf6o5wLj_6bA7Mly8vgqnTj9sv9zgwS9LB16SKUfR1RO8ix7gQaid-JpHeLukf05dg>
X-ME-Proxy-Cause: dmFkZTE8Z6KAvo6s5LyXWAwbuD/UnK64qYwdv1YfBofBfgBP8B/DLQkuOYveqgoGBohnuM
    +I08gZcpJtBgYGPhvdQUUj0Mkmwwiwo24Y24kNwxhN/6Ex4ri5pvzLDwS1pNoy9BfKIJzL
    izXIeg+qbJdFLGYQ64vT24rM4ucGoDWn2fMzb5BaYanpdcO0FTm9GzwdvgjuooIz2gzXSM
    XzowMlouIzUMUdmheddKs2zJzXA4CVhyU7KyAJ7q06FBnU58LMZ1bZ5Lr8lOKnJzRvSy6+
    XjYmu1SWidMPlNm3f1fSh7pVIq+a2XxgWnCIXdH2flbA5g+w2hedzhFz4hU9eny+Wai4YO
    tNdWW4/MyNhgbqItRXizHUj3B24tGFHxrwW2snd+y/71zzrKqrKEgoNAj17QOVFfNUjtT9
    eBFPqfcLCiQv24JnnHzYX6vA+eo5Gih5Nu8IBJiXN/zydCmEgq2gfVmGcxfSMPNhGH2Cbj
    TuCZMvEY0UCruRJhEpeCYtJ92l0iutuingEyFhsg2CV1jgyhriY3BO+orGN/DG5AsJQr2y
    5q/jJ3xWK/rfRocNZK7H8eAJYCgODACTfTbRasDYw3YdGq5dhCF34X/vAigJW9W/+Mtotz
    irB117AybyQDsn9aIY7QUpuc6mJywhnUGdGPIFmAAnXtaqWqFu1p358NZT7w
X-ME-Proxy: <xmx:KNtVaiPe7Tzo7w5tUNQMmwbiR3am_OZOe1KBUo_EV0WDljrzbkjoiw>
    <xmx:KNtVaso_xTykEBLeXqQT7mRHXtBDc7Ns3RJgMRlEtd2jNuKana8YgQ>
    <xmx:KNtValum-EHzDsToFjif7vVV0LmHQjtQ-mhh04vBUNsXB9nvNRI_vg>
    <xmx:KNtVar1uVh4uQjCb6VMoA_TyYYF_Q0qdjx5Ye8DkuOPn8CgDcdZfPg>
    <xmx:KNtVapySyoGe307ywKDRtvAGXbImNWwgb_Tpl-FDEMjbMyeIgrbWjuR4>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 14 Jul 2026 02:45:59 -0400 (EDT)
Date: Tue, 14 Jul 2026 08:45:54 +0200
From: Greg KH <greg@kroah.com>
To: Praveen Talari <praveen.talari@oss.qualcomm.com>
Cc: Mark Brown <broonie@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the tty tree
Message-ID: <2026071417-fritter-mahogany-bb97@gregkh>
References: <alT5UdRqcfFmadZT@sirena.org.uk>
 <12e1f767-d126-4f36-ab95-caf3252a5728@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <12e1f767-d126-4f36-ab95-caf3252a5728@oss.qualcomm.com>

On Tue, Jul 14, 2026 at 11:36:44AM +0530, Praveen Talari wrote:
> Hi Mark,
> 
> On 13-07-2026 20:12, Mark Brown wrote:
> > Hi all,
> > 
> > After merging the tty tree, today's linux-next build (x86_64 allmodconfig)
> > failed like this:
> > 
> > /tmp/next/build/drivers/tty/serial/qcom_geni_serial.c:1925:4: error:
> > cannot jump from this goto statement to its label
> >   1925 |                         goto error;
> >        |                         ^
> > /tmp/next/build/drivers/tty/serial/qcom_geni_serial.c:1931:44: note:
> > jump bypasses initialization of variable with __attribute__((cleanup))
> >   1931 |         PM_RUNTIME_ACQUIRE_IF_ENABLED(uport->dev, pm);
> >        |                                                   ^
> > /tmp/next/build/drivers/tty/serial/qcom_geni_serial.c:1916:3: error:
> > cannot jump from this goto statement to its label
> >   1916 |                 goto error;
> >        |                 ^
> > /tmp/next/build/drivers/tty/serial/qcom_geni_serial.c:1931:44: note:
> > jump bypasses initialization of variable with __attribute__((cleanup))
> >   1931 |         PM_RUNTIME_ACQUIRE_IF_ENABLED(uport->dev, pm);
> >        |                                                   ^
> > /tmp/next/build/drivers/tty/serial/qcom_geni_serial.c:1911:3: error:
> > cannot jump from this goto statement to its label
> >   1911 |                 goto error;
> >        |                 ^
> > /tmp/next/build/drivers/tty/serial/qcom_geni_serial.c:1931:44: note:
> > jump bypasses initialization of variable with __attribute__((cleanup))
> >   1931 |         PM_RUNTIME_ACQUIRE_IF_ENABLED(uport->dev, pm);
> >        |                                                   ^
> > /tmp/next/build/drivers/tty/serial/qcom_geni_serial.c:1887:3: error:
> > cannot jump from this goto statement to its label
> >   1887 |                 goto error;
> >        |                 ^
> > /tmp/next/build/drivers/tty/serial/qcom_geni_serial.c:1931:44: note:
> > jump bypasses initialization of variable with __attribute__((cleanup))
> >   1931 |         PM_RUNTIME_ACQUIRE_IF_ENABLED(uport->dev, pm);
> >        |                                                   ^
> > /tmp/next/build/drivers/tty/serial/qcom_geni_serial.c:1881:3: error:
> > cannot jump from this goto statement to its label
> >   1881 |                 goto error;
> >        |                 ^
> > /tmp/next/build/drivers/tty/serial/qcom_geni_serial.c:1931:44: note:
> > jump bypasses initialization of variable with __attribute__((cleanup))
> >   1931 |         PM_RUNTIME_ACQUIRE_IF_ENABLED(uport->dev, pm);
> >        |                                                   ^
> > /tmp/next/build/drivers/tty/serial/qcom_geni_serial.c:1872:4: error:
> > cannot jump from this goto statement to its label
> >   1872 |                         goto error;
> >        |                         ^
> > /tmp/next/build/drivers/tty/serial/qcom_geni_serial.c:1931:44: note:
> > jump bypasses initialization of variable with __attribute__((cleanup))
> >   1931 |         PM_RUNTIME_ACQUIRE_IF_ENABLED(uport->dev, pm);
> >        |                                                   ^
> > /tmp/next/build/drivers/tty/serial/qcom_geni_serial.c:1864:4: error:
> > cannot jump from this goto statement to its label
> >   1864 |                         goto error;
> >        |                         ^
> > /tmp/next/build/drivers/tty/serial/qcom_geni_serial.c:1931:44: note:
> > jump bypasses initialization of variable with __attribute__((cleanup))
> >   1931 |         PM_RUNTIME_ACQUIRE_IF_ENABLED(uport->dev, pm);
> >        |                                                   ^
> > /tmp/next/build/drivers/tty/serial/qcom_geni_serial.c:1848:3: error:
> > cannot jump from this goto statement to its label
> >   1848 |                 goto error;
> >        |                 ^
> > /tmp/next/build/drivers/tty/serial/qcom_geni_serial.c:1931:44: note:
> > jump bypasses initialization of variable with __attribute__((cleanup))
> >   1931 |         PM_RUNTIME_ACQUIRE_IF_ENABLED(uport->dev, pm);
> >        |                                                   ^
> > 8 errors generated.
> 
> I don't see these errors in my local build. Is there any specific way to
> build to see these errors?

Nope, I can't duplicate this either on my side just by building this
branch.  Is this coming from a change somewhere else that modifies
PM_RUNTIME_ACQUIRE_IF_ENABLED()?

thanks,

greg k-h
