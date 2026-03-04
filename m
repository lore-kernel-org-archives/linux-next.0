Received: from sphereful.davidgow.net (sphereful.davidgow.net [203.29.242.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF68937F004;
	Wed,  4 Mar 2026 09:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.242.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772615790; cv=none; b=olITQ1T/lsczQxgAp+GIydozpvljUPsmJvph/Xt4J4GB1ddcXUU5D9bRIx+qLWKC5brmk59ikJQqgYsb2y9lxfU93aaCbccmxG1BXtf9qAsV/VDDyqtXhUURkV8WrDgahwHtfHGxzXwcMI00mdeItUNGQoIMECrPOVjb0EBQObo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772615790; c=relaxed/simple;
	bh=p1S8W2bDBnZOMR5TVn0SFhPfN4ayTxVH96b3QKO9V9M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K/uxKEqaj4whZF9DOvgMUlz3fptI+bqcn3WBVA1vclQbkBKGDIFMNE80eq8O5bva1zcP3ljDZZvN5Oeu860v45wC2Ealo60PDzrUVwVdZvjBFpNzXMN/p5AV3GRzoA/7LyLV+eQZaXmX8osbyv7rPlSWu9XeObScIQAPlmkfLh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net; spf=pass smtp.mailfrom=davidgow.net; dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.b=jSobDkIC; dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.b=NQ6vilbC; arc=none smtp.client-ip=203.29.242.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=davidgow.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.b="jSobDkIC";
	dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.b="NQ6vilbC"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=davidgow.net;
	s=201606; t=1772615780;
	bh=p1S8W2bDBnZOMR5TVn0SFhPfN4ayTxVH96b3QKO9V9M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jSobDkICCCVCEynas6OJt2OdpgFaTjqmbx9+AtjASUwYrUANeKarMeqOB2djugrMh
	 DCUqr1o95/PZhY7/wSNqaaLa1wPQ9Cit/vV/DUvmDq/m09adbxmVm0nnY/UtP3cUVP
	 AU2SN20mM5m0vGCsv/Fh81fUUi1EXj6yt0CtClFUof2ujaGoaxWcLOs1oQTUAvDXSZ
	 sfgnFs6lQiBwAij+v1jJdhferL0OIxdlBPO5cj/IPDCoLGtGPNBwe8Ti0SYf8bG1To
	 hdyOjGLGQa8iMEm2NrVsgd75znDBx+0wrPF6n2EXf9EJRXSBTm0ndl3EG64mhOTGsD
	 fT2aTJAaLFOhFbmDqroan0qPd/ykdSunG3OWxAsziwo+M/GHnfbgsfGyOHkGjwZmm8
	 C6TTLZ6ozb5JjVXdmYNCnH/Cy97cg0uJkVLYkyb2Wf43EQoO7nxFlxQBdGDb+9/VNo
	 PaG2SAR+bYvme30Up12+UE4J//BNMl1HYVLB9wLZKfwra/Vd+n8R0a86UWJACSrJ65
	 DYbr8ich48h4TvSWu+xk+dAHasM/nchZQmO8t7t+PwIndSsr/3OU+DTQyJUKEX5ZI7
	 +UPG02AAxT+uiph3L4L5toWe/zuno6jqTfzTAH79HayqVFPXZ4LVHtkm6Wu8Pp6j6e
	 ko7Snv2/gk8gkgyQtx91rgOA=
Received: by sphereful.davidgow.net (Postfix, from userid 119)
	id 507BA1E7BD8; Wed,  4 Mar 2026 17:16:20 +0800 (AWST)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=davidgow.net;
	s=201606; t=1772615777;
	bh=p1S8W2bDBnZOMR5TVn0SFhPfN4ayTxVH96b3QKO9V9M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NQ6vilbCTxRrdyNTHUJBNgwrzdtnSxuBQO9Qy25iqZWBjoHm+FP+bwLMVjSxbPFgr
	 /FV02pcn9rrywkutrYWQZzvFqA4a6lLRhrv6hV6Y6gHMjyy6nchjOL+ZGiQsiM5Crw
	 P6V4PQnNXF5PMIQThiyA2W5ahEBvl4Vh2lG/co/lhnqolNWcpE7fc/tj9O7xMen0wX
	 r9Exb8eheMfhWcbIhwHfCijMUq8GYSp8xapx8MV3cXVZ9G5CEeq/3K5yK9pV5L6Qso
	 qUbuSEjmBPGznn+nKZdB3hZBytFGzeTvLdcn0/sR4m3ZoKv1R3/f2pBN2vG4VxGblf
	 n/QvxoGDgwjFtRqKK0VPG+e5nKTHv/ISGuL1hg0dYGa5imWIIeWu0HR9wbrpmlQB3U
	 jq/tet/01BuuYNISliOVZhetxKZUEyGwjg7/Ce/aSUg9ViiZFyaA1FRmGTr+FbLou1
	 tBMRQMgVqhHak3AaG7J1wHExxSeIHspgt4Jt/TEj8WXVo+mZyrDa35dqsf16Jsree6
	 Sz+npRa/drASEo/ihEQ3ksBFWCy2hLb7r3RMDU4WhkTqVuukc4cY3wWMmJRi2sXtrt
	 Rfft2fK91b4zxrVdJ0KYi5PCGeeCryTVPA4rexjJhbyrVVPXvlFfGoswlciywvy+Rq
	 B3N4tP7s0UVGO6B9b7WrQ/tQ=
Received: from [IPV6:2001:8003:8824:9e00:6d16:7ef9:c827:387c] (unknown [IPv6:2001:8003:8824:9e00:6d16:7ef9:c827:387c])
	by sphereful.davidgow.net (Postfix) with ESMTPSA id BAF2B1E7BD0;
	Wed,  4 Mar 2026 17:16:17 +0800 (AWST)
Message-ID: <e305159b-13fc-4084-bcbe-968388575627@davidgow.net>
Date: Wed, 4 Mar 2026 17:16:13 +0800
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: manual merge of the kunit-next tree with the
 kunit-fixes tree
To: Mark Brown <broonie@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>,
 Brendan Higgins <brendan.higgins@linux.dev>, Rae Moar <raemoar63@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Shuvam Pandey <shuvampandey1@gmail.com>
References: <aabpbnOt9nCuQrfu@sirena.org.uk>
Content-Language: fr
From: David Gow <david@davidgow.net>
In-Reply-To: <aabpbnOt9nCuQrfu@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 03/03/2026 à 10:00 PM, Mark Brown a écrit :
> Hi all,
> 
> [I note that Shuah is the only contact listed for the KUnit trees, is
> that right?]
> 
> Today's linux-next merge of the kunit-next tree got a conflict in:
> 
>    tools/testing/kunit/kunit_tool_test.py
> 
> between commit:
> 
>    40804c4974b8d ("kunit: tool: copy caller args in run_kernel to prevent mutation")
> 
> from the kunit-fixes tree and commit:
> 
>    7e331b560a76d ("kunit: tool: skip stty when stdin is not a tty")
> 
> from the kunit-next tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
> [Sorry, forgot to diff - it's a simple add/add.]


Thanks, Mark. Shuah is definitely the right contact, given the KUnit 
branches live in the kselftest trees, but I won't object to being CCed 
as well. :-)

Shuah: I suspect the simplest resolution here is just to rebase the 
kunit branch on top of kunit-fixes. But it wouldn't be a problem if you 
wanted to shunt the stty fix into kunit-fixes instead (though that'd 
still require a rebase for the SIGINT handling patch).

Cheers,
-- David
