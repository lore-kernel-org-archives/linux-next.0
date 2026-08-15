Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87AAF345EDF;
	Sat, 15 Aug 2026 08:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786783494; cv=none; b=gS10K66fMY2g6T9tBTG6S6/fpk514W2drTgT24ITc72oXXYA4/8BwC5FOYJCYCPwHX2ZJyZayhC1JWP3poRBsr47VqPOTqb13YGjg6xh5fExDnNSM2aLTxZJqoFwg03JUHj1dNYTEVvwu7iahK9+iCjgHPwdxAjzfcQg71zZgL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786783494; c=relaxed/simple;
	bh=bVCCefdajcGVavaMEPrFKUg64Lx4SLUNvI25tI9ZX7U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ka6csdux06QMtYELm827Bp7uTNd3QcnGwIBwr0EA+kjWMuBkhAbbo1wMOW1X740cwsmOFp5Nlit8N1gBglL8ep2oyKyTQ7+nKC4oxal3dI1utewlziutkwoa9KTBwgSsVq4qBIERFMTb9sYLSascN7RX3NrJrKg5W3fFAWwhXBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b=JzCm/eOR; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b="JzCm/eOR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1786783479; x=1787388279; i=deller@gmx.de;
	bh=Lgpk3Vpo735lkElOMXA7w3H2sraWGYbHbEbcWqWlkE4=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=JzCm/eORES3zZmmfjVFhhXPUg4wrY2isW1DcTwdLjkITlPfpgLnviDRX5Hv7jS5P
	 verkGMylCQZJT9HO4RgfXjJ/vHs5agiMMAM2JhG6t6BuFqCgbtU0tJMIcLuppaONt
	 Gbp3jOSTRdVj+BbPhTwhS/3D/F/mINh2+MEeCj/RlO40BfVBFTaHkcstn+NrtN8PB
	 G5J9x5UEucOQuOdOhcNYhjQQooXpVQqfzs6knMz5cptycjcmSt2k01a04aCGpJ6lP
	 +OcVcHGL7vs6pFuItz3piyMMaPwndK7mFTvIn7eFFphgm+yseCrua380yeysq1PRO
	 vOt6CvhlAZzHmyPYow==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MkHMZ-1wXLhf43Rp-00n5fU; Sat, 15
 Aug 2026 10:44:39 +0200
Message-ID: <41962598-2237-4150-8c45-2436bf07efbd@gmx.de>
Date: Sat, 15 Aug 2026 10:44:37 +0200
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build failure after merge of the fbdev tree
To: Mark Brown <broonie@kernel.org>, Shixiong Ou <oushixiong@kylinos.cn>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <an8-iMG1haqotufX@sirena.org.uk>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <an8-iMG1haqotufX@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:PXUrq8G+Up9hmip7fAk+LNpkcLaKQF9hfO6De0GtEN7OuvofDgw
 FcgOsuVS3lc+myM0rk/RosHZ52pbQW05ovhrzBbQwHU9vYJRhWD512dMsS3bCGR8K0KZBbd
 4Zvub+d/cJH92dhmLhCYSfVCYtvrtsckO5WSq6Ho3Kc/jLukWjRboaqLlT8Igbn67X3y1a1
 yFsPAWyC0OIq4TeuLwHEg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:LTfGWRaaouk=;zZw9C9F8c+5WWEq3F4eEJAO7zcO
 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
 IAlQZRZyQ8gGsTNw==

On 8/14/26 18:12, Mark Brown wrote:
> After merging the fbdev tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>=20
> /tmp/next/build/drivers/video/fbdev/aty/aty128fb.c:2027:6: error:
> variable 'info' is used uninitialized whenever 'if' condition is true
> [-Werror,-Wsometimes-uninitialized]
>   2027 |         if (!pcim_request_region(pdev, 2, "aty128fb MMIO")) {
>        |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ....
> Caused by commit
>=20
>    99c188b02c281 (fbdev: aty128fb: Convert to managed PCI and ioremap AP=
I)
This is fixed now in the fbdev for-next tree.

Helge
