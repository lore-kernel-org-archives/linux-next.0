Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.145
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794823198;
	b=cRQB6p8n8EqULSD03vbjYW+QzsuIupcjv9QYL2u/U3q76zpfLZmGJLOWfrAkEAmi4snl
	 N12s7hgIn4iKXjBbAhfkrE2EfGINqaLajTdqReK256MIOp0dSjJ5nouxQF2r+E6vTFs7P
	 cO/9qWw/wWKbfR2WL2072qgn3Vmx0UamB8O098pIPdRyaT+EaqT2YHq2mASK/+nooHfwC
	 joOkVKphL4yznX05Ry8VEG9df7yjlTV53p+VLnliBzMc6DX1Gh1BTCQctvFdgKdxfXjH3
	 VI9IBSxbC/0WKM/kJ66Beb54LfURr5fApiaM7Z6kSytsCBlCJ6zrHP8mHuurtZmI8cA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794823198;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=a7wSifXxoKvCHuLDVxMXLiC5Pkj+xR4ZtCOTj2ufMzM=;
	b=YNxlwYSa6I8XA/33hng9jBX7iLtYldUyAXre7SvM/boklft8mPjaVtDrTzxRaR5HmPMj
	 U8aKIwLdmI8ry7HsbCNIkbA20q6a9uwuzGcZywTvPNKTNmtMDvO4SaYjL4a254VY7jOJO
	 wWkbZdq5krwC2VYd+cWOCeUNEVmssQQF/49p3/B4+6RCpgHV2X/EhA4zQv/YlhUMiLOEJ
	 1YyVpdNVnDQfA30cwPnHIvXWgw/tIRMqXSsU8ZLs8PPWyOuh9WdKs9RgllJV10Oyp2yOH
	 wtls5xMYErZb5C9P82j6CqujsZMLXJq7c6//bs+8aTzw93VegS637P0GHM//XmScheg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arndb.de;
	spf=pass smtp.mailfrom=arndb.de;
	dkim=pass header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b="dFY8/6ko";
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=qpgIJSFf;
	arc=none smtp.remote-ip=202.12.124.145
Received: from fout-b2-smtp.messagingengine.com (fout-b2-smtp.messagingengine.com [202.12.124.145])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E379606A31C
	for <linux-next@vger.kernel.org>; Mon, 16 Nov 2026 09:59:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E379606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=dFY8/6ko;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=qpgIJSFf
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfout.stl.internal (Postfix) with ESMTP id CDEEF1D0013B
	for <linux-next@vger.kernel.org>; Mon, 16 Nov 2026 04:59:56 -0500 (EST)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Mon, 16 Nov 2026 04:59:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1794823194;
	 x=1794909594; bh=a7wSifXxoKvCHuLDVxMXLiC5Pkj+xR4ZtCOTj2ufMzM=; b=
	dFY8/6komEzgoYb3Y2vqmdQiGwlO6M9QWkOeTp1q58POvEO0feMOr3BtLYKxsGnL
	fGes5D+VCxvJMSm+/dJXaI8KkVe+TjiWVDkG1VH088Wm7nVoWPOWDEQSpJm3xVSb
	87U1oZGsdTE0EsCaVZxWjNHaMYUiL6d08vSSjY5HV5af/risSCb7yDXcQGxG4JQT
	YImn8B7w75N8mD6Rl2sIlbrIsNsiY1St7ig1bt/Gcwbpabuv+k1UAF17TgBa1UJJ
	PwUimbaeNVX7SCt4amaAcX6QOM35evVR06LIhEnsHEr92R6Paz1UBjJ0pKr1KTwt
	y6MSB+skUVnLS7idt59tLA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1794823194; x=
	1794909594; bh=a7wSifXxoKvCHuLDVxMXLiC5Pkj+xR4ZtCOTj2ufMzM=; b=q
	pgIJSFfk9kLKkBckEyrfisaNXb8+W1olTOiMC+KK9tvz1zC8J4aQ/kwjpNdOONLs
	+M5ZQ+RtkBfGve2OJ2GRjQ/Xi6UusdOcXWty2s27Ou1hj2AROvaUVcVD8E/1rBEZ
	ihCenAKZUQMnGf2vP1wmhcS0+oGP2T/7ucnQYj59uGWe0BSLN7fvA+5aAvl2898A
	dk2byGXTwpXh3huHGRlkGXoXMBxgD+iyX1XwFAjyCHjACo1IUwhpjaTvo6I99t3n
	ARWuh7MpxGZsU/6FGRc+1bK9zRFQDiX2By/H/0hVhUcM0Vqz/yjqLFCoW4rKqFc/
	ZEEW6JkBpS3OpK50J+mxg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794823194; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LW5leHRAdmdlci5rZXJuZWwub3JnPg==;
	s=fm2:rsa-sha256:LgOQxt90INc8b5BSViFpp3Tf7Zx5eGz+29W5QDF9Klcqlx+
	Tc+sHv7WBBP58eZXbxiUCM2Wu1jkv33vgnnWUTFyWxkHyvuoirp28ku78k8fW2VU
	GIHcD7848l+jfwZ2JxS+KOfCE9L5jca/O722m6bSOM87GcRM0JiIJnxdNJWaKSA3
	9qtw83hCys9h3WSWqEKIxe48rFmQO+AZR2msvM+NHc5jkskGpMtD+C0j37LeT9kV
	g3ZAerYwgJNyM30CpPfW1ojBj10a2CQuOQ1xWduJOuc1S3Flrk9L49c99PnQg7Xt
	HShv55QOhax+afW+etD250yCZdcWBtk/eCDZ+Ow==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:e7Nd2GgF0tQp+32u16V7G6/0sbpsISzg+iXd/rCg4pg=:2oId+2bWZGmI6eNla/jqfSiJnIqNQs3cMc8kEg3AMDQ=;
X-ME-Sender: <xms:GNT6ao11tRSFAd0dOOgykOSzmmY90FPxnHXvFtofvAKTdLVifJCkTw>
    <xme:GNT6at6OalhevobvhmLgcOURl2Xc1EEzTMqR96x1S_vFiqQd9PGVzdRAaTbi2RTVQ
    zK5V1qnwKGQ0o1nCyShpGvSE6K7v1O5aVf95ymsKTenGByB2gqbAJfm>
X-ME-Proxy-Cause: dmFkZTFWmmZvctIyn4mv4NGxgCI0Wc2cqXN5Pwz8jaRG5xa1iEyYknZho3xZfs7kXEg6Kd
    Gi/FKk09/KzIl2a0vw+Qu4JnXCXcI1TS2yxje/StF+bu0tIxUPwwsHeDpgKG7pimxGsdr+
    EWU8PcktcPzk2OJ0Ynx6HZF00XrC8sAm+91oalxLbGQB/UIlMGPLg5geXseuk9H9H6nysb
    DmZLGwSvca18wPJjdoiQgoqOorlnKUl0P4qgtzef1sdSUmudCW49W0meK6duji9dgkIcl6
    L7miMX4ZAKvigM+jv5VzE+wT+ShUqGGK9Iq7AKh3O6LkV3d+956LR52V1SyzZ2nFudbXa7
    vUvgWrJcHTSbGzPaLs0mD1GZBNf3FSJ7/6v/1ymZs+2YLwCFfHL98LC0CRfynTwsxS6MMB
    GQYkvOuFJWnfjRUdD45mX+vgJo3/QjGVVcqYQgcY11tyB/OO2p7T4kJaQKQvg4Kd7wjCeC
    qsEGjHSQ4fsvUUnhCAEf2zf9wNanQgkciPW1qLsdpb9K6AO8R5ioEfBkAK6hUYC2gcfgkG
    wFfvNjkS6oc/VRRMKLlVPsJf+O34/u6RtWYml46JjUScbyqSpdbGtjmmsY/2srP0w/aBt0
    B9yHblFqgZKEZiWCuZQuU9BI2phhJ0g+4mC1OeDuDN/8DBjQXhUBlg4VvKSw
X-ME-Proxy: <xmx:GNT6ap8elTZNiIr5JqUs7BJMFSCrowARTtkopibtnlLTJEADR-FJvA>
    <xmx:GNT6apIxK6Lvp9j5etlwfFgWjKEOixj0-g6Q0_7YtEddRK0cJC4Kxg>
    <xmx:GNT6aqhacLGbRybBQIcm3g6v61DitqDf1T2UTrHk9I6M4ni07JPc4g>
    <xmx:GNT6ah5wVtzqO5h4aLsH1c0Y_j8usw6H7HL8ppIJVijzTwo8S04PNQ>
    <xmx:GtT6ahFWXdXDkoySs4Bj_ns6R5nfbkprSoNmmtBwg9hE8fkS2sywk-6k>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id E49AA32A00A0; Mon, 16 Nov 2026 04:59:51 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Post: <mailto:linux-next@vger.kernel.org>
List-Help: <mailto:linux-next+help@vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-next+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-ThreadId: AOb5ClfA_nYF
Date: Mon, 16 Nov 2026 10:59:31 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Thomas Huth" <thuth@redhat.com>, "Mark Brown" <broonie@kernel.org>
Cc: "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
 linux-next <linux-next@vger.kernel.org>
Message-Id: <43b9889e-f504-468b-af05-d62e1043edd2@app.fastmail.com>
In-Reply-To: <a2ccfd68-c773-416b-8aac-12a7f9caa801@redhat.com>
References: <avcnFxad0xS5KrZs@sirena.org.uk>
 <cdd71b25-9149-476b-b31f-c29b3b2896b7@redhat.com>
 <c96b327e-959a-4363-bb39-f9e313c92b9b@app.fastmail.com>
 <a2ccfd68-c773-416b-8aac-12a7f9caa801@redhat.com>
Subject: Re: linux-next: build failure after merge of the asm-generic tree
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, Nov 16, 2026, at 10:55, Thomas Huth wrote:
> Am 13.11.26 um 17:16 schrieb Arnd Bergmann:

>> There was another report for the 0day build bot about the same error
>> on powerpc, but not enough information for me to reproduce, so it's
>> possible that we need another fix like this.
> I was finally able to get access to a ppc64 machine and tried to reproduce 
> the problem. But it was just the vdso_test_chacha test again that was 
> failing there due to the __ASSEMBLY__ still being used in /usr/include, i.e. 
> the same problem that we saw on aarch64. I double checked that it gets fixed 
> after applying 
> https://lore.kernel.org/lkml/20261030174323.370687-1-thuth@redhat.com/ , so 
> unless the 0day bot had a very unusal setup, I think we should be fine.

Ok, thanks for checking!

      Arnd
