Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792587666;
	b=x+AZGxI9sMsX206ku6slAUv47E7DUX8YuA2HdI+FI/O4lsJoMoekG1O5SOtEiFc4JZB8
	 lPhJUnmFHQMQqYwT8P0TJE3vlopC2Fe3uM4LLeLKXXUYadIE2lT+x8diT0EZKzYRZGxMX
	 oftc+3elXYOuRwHxAGeied2VvtVEm/QZUFeIe868qVk85QuomTyY2jK8VtzTBNN1MwAsa
	 jqbIIBfoMLziJR6rR2TV+j9COWN+Hx1hy3VfCYSNYELHNvT3C/oIY8GiDfVQYbwQ1cnU+
	 S/Nju2ESHjDL+uNz2LgUZYp/nHIpzRZlj05qE0fCW8Znc0nCXVAF7OvuJpSfUbwUi6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792587666;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=amQGH1hwIa+htL011xLiNvU/lDwW4NULLyl99/iMwB0=;
	b=y81j4IDWbGaPFFRyTqi1zsAJhm3aANdVOyXajkdyGdQ6Dg9DCySplm9Ifyy7ogLAOc40
	 JqlBzXxUwj59QOnX5inEv3KZRry3LPofMdUZaFD3IVPyazlnlPQ4L0pNdS3Hj6+xSJwWK
	 Y3V7Ihd+kb4XbKa/khxEwYheYyCw31kOwgJ0BFLtTtbGG8v1yxBah7nvsNO/cY3/qay5J
	 j9un8mgEeN8dCZ3+0zQ00O8nS3VhQ/rqXybaNxjJegp0rp77Y8RzN6eBMVDvWStUOlN1T
	 lQnkhu6LaCm/lsFmhbywKS42pLgbrix343POzGRxbAbmoDSYKfhf/odqEY2TubRYHQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Ozh8G6kW;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=F32sgjuw;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60390606A320
	for <linux-next@vger.kernel.org>; Wed, 21 Oct 2026 13:01:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60390606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Ozh8G6kW;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=F32sgjuw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792587665;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=amQGH1hwIa+htL011xLiNvU/lDwW4NULLyl99/iMwB0=;
	b=Ozh8G6kWaAnPHnLAb9UZVK0rYxqSCXI0pHsO+va1Ze+R5jLpLUy7DR9UfdE2c65sX8nH3Z
	7bJN3CaKTJHUstIEE45omZTPn+kykDvkmEUE/i1PDtRmjj/GSB7jjUJiVNmpIo0lIbMJ3U
	45NJA4iF1AgCCqvQXtzbWl6W+sZuIf8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-425-YVoA01wzMD2DQekp8z3j2g-1; Wed, 21 Oct 2026 13:01:04 +0000
X-MC-Unique: YVoA01wzMD2DQekp8z3j2g-1
X-Mimecast-MFC-AGG-ID: YVoA01wzMD2DQekp8z3j2g_1792587663
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4a1d1f26a63so7287095e9.1
        for <linux-next@vger.kernel.org>; Wed, 21 Oct 2026 06:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792587663; x=1793192463; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=amQGH1hwIa+htL011xLiNvU/lDwW4NULLyl99/iMwB0=;
        b=F32sgjuwKIaadVhRyU6KLDKjaQBYDOaOMJ9yRT9/hBi+yB7S+QcHwQ2JSlbhCcWlYG
         iCWhhYCUHmkGUJFlOxkjhfcegFbsbmM/IXs57AgZ8NnrUrZa/Jl2YoUtwYVwAeGn6a0b
         VDm+TltYm5I/2ehCxIMYhC94lNPQXCPBMvpU8FDUCBYEFdmm4SgrCcgdjOXV4YgDsWVY
         npZABO+m80P2uciGRf+Yo9MOHr3x9CN2rWMiUzrM2GM652Z3OfSQRSVFfmpVx+VaKA1+
         qCNpW0R82BGYmLd9CQ7T33XHsD3Ul4dq+m/F4NVFij76DV8ugLBTyAevrYzG+BXAlR02
         9o1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792587663; x=1793192463;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=amQGH1hwIa+htL011xLiNvU/lDwW4NULLyl99/iMwB0=;
        b=DXgWColnhFKbvGD/ztWxcT6c4nekRS4U853c5YpoIIkxKfvF4lwWwPh82RtLeaakT+
         ChEL0PBNSITizAGjLe/TbhtPTZfi2JnLNscDdUEHYOyhGHdpKiZa2+K6neUoH6t2elJl
         dUFmd6ql6JLw/SUt7T8/jOQggvpW2on4d53nEkjAWUk/PYY9E8aDQVMIR6/0qBDm49KL
         MFk+oZRypyVzH4xheQqO1EmvLuEuQeIZ83nf0Vdb9zMQFz5g2EfjaVsnnIv5yXDcnKfL
         sPBo4C9NWOVhrfaUrL7RP94to3LogNeda0nm0L2QlbVR7Pb+fV2qT4bMtw8WqkhFMfPi
         q/Qw==
X-Forwarded-Encrypted: i=1; AKwUvBzD0pZXTlMSN/VYEkv+F+R0rpzrgdhI4tFnLLAhTsO65tCt5440hduX5vSp8cs12ZX3qeiOpN6wCprq@vger.kernel.org
X-Gm-Message-State: AFq9FYKKl3pgE+YpHgj3iSrIZieDZ7GZZE/VfCYERRrlKEKWBOFqcLzT
	Sbhqd/x8R61I/Abg/Ec/RZxEKfVlhgQmVkq+4vpeZxwGDfZIX310Lc8fvpd+RQTWYLXFZn95hHO
	ERkRDuUDXAFEhaTSM5t5mX/dnbHR3Y04iqp9KDfGg9Co0+BZxq5F/i3N/07y4ylY=
X-Gm-Gg: AYBFou08/ps06WIILeSlDGIQB4tHqWj6dyyDWClzWSxZrqs47h9MN8YpLT2JIuRh+6/
	osMgW6ztotrqOk4OGc6plEljoyRC8TF4OP6D1hD8CYU+zBsMWn0wiz0Nfma0fhSdbSXBtXMj4/2
	7JqECoc/3U/nMZMAnbHycA+ItO2IG2YEZKbj1vuwdBK84M1BAW5d/VBwHe9swLqEreRuECSO9xy
	hJNkouOa8fbKOTlM/x+u01E2acMtE1tOZezoKt6tHVNTJXFc6dQU/1YOyGhm1iONeW7+3YKlJ+E
	XfVq6se6oy3hNb1RNqXXXdLv237tTZhS9afqosAmjNGsbOiUAfYGtNVAdgcbOSngduGrLGP6Ole
	DuMM8JFyFvcP6xnzLZnpPFhISj3KGshq4iP9R2bSNph17vjtNH/ja5SwN7I5ioagQKBMh6PfzCg
	==
X-Received: by 2002:a05:600c:3b24:b0:4a1:f736:79d1 with SMTP id 5b1f17b1804b1-4a1fdb20d04mr44730015e9.16.1792587662074;
        Wed, 21 Oct 2026 06:01:02 -0700 (PDT)
X-Received: by 2002:a05:600c:3b24:b0:4a1:f736:79d1 with SMTP id 5b1f17b1804b1-4a1fdb20d04mr44725765e9.16.1792587660186;
        Wed, 21 Oct 2026 06:01:00 -0700 (PDT)
Received: from [192.168.188.234] (ip232-47-231-195.pool-bba.aruba.it. [195.231.47.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e25835e22sm6113081f8f.44.2026.10.21.06.00.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 06:00:59 -0700 (PDT)
Message-ID: <d6f50e2e-adcc-4d85-9be3-ff24cb8f8cc2@redhat.com>
Date: Wed, 21 Oct 2026 15:00:56 +0200
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Post: <mailto:linux-next@vger.kernel.org>
List-Help: <mailto:linux-next+help@vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-next+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: manual merge of the bluetooth-fixes tree with the net
 tree
To: Pablo Neira Ayuso <pablo@netfilter.org>, Mark Brown <broonie@kernel.org>
Cc: Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Marcel Holtmann <marcel@holtmann.org>,
 Johan Hedberg <johan.hedberg@gmail.com>, David Miller <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Liu Chao <liuc63@xiaopeng.com>, Networking <netdev@vger.kernel.org>,
 Piotr Kubik <piotr@kubik.pl>
References: <atiblfL12VddJgjU@sirena.co.uk> <atioPA8ofnC-PCGi@chamomile>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <atioPA8ofnC-PCGi@chamomile>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/21/26 13:55, Pablo Neira Ayuso wrote:
> @netdev maintainers: Please, see below.
> 
> On Wed, Oct 21, 2026 at 12:01:41PM +0100, Mark Brown wrote:
>> Hi all,
>>
>> Today's linux-next merge of the bluetooth-fixes tree got a conflict in:
>>
>>    net/netfilter/nf_conntrack_netlink.c
>>
>> between commit:
>>
>>    cd37ab22a74e0 ("netfilter: nf_conntrack_netlink: fix inverted IPv6 tuple filter")
>>
>> from the net tree and commit:
>>
>>    1ae2d094b0200 ("netfilter: ctnetlink: fix inverted IPv6 address match in dump filter")
>>
>> from the bluetooth-fixes tree.
>>
>> I fixed it up (see below) and can carry the fix as necessary. This
>> is now fixed as far as linux-next is concerned, but any non trivial
>> conflicts should be mentioned to your upstream maintainer when your tree
>> is submitted for merging.  You may also want to consider cooperating
>> with the maintainer of the conflicting tree to minimise any particularly
>> complex conflicts.
> 
> Sorry for this: This patch is duplicated, one variant went into
> net.git and another into net-next.git.
> 
> Two possibilities:
> 
> - Revert 1ae2d094b020 ("netfilter: ctnetlink: fix inverted IPv6
>    address match in dump filter") in net-next.git
> 
> or
> 
> - Revert cd37ab22a74e ("netfilter: nf_conntrack_netlink: fix inverted
>    IPv6 tuple filter")
> 
> before net-next.git gets merged into net.git, because these two
> patches address the same issue.
The 2 patches are equivalent, right? We pull net into net-next before
sending the net-next PR; I think the easier solution would
be manually solving the conflict at that time. I understand that accepting
either 'net' or 'net-next' variant would be ok.

/P

