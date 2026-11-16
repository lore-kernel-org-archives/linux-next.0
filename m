Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794822919;
	b=PWKik1oOnfPXnH/0i/2+iQs31+KdUgoy+kv/dPPCuj8G6/hEJYbsXY1mg9ytYQ7eb64L
	 nw44WdMyShOsssvoUwzWkVlc2S4nJ5g7YGb6P/lBXBuRVIczI9XglNCtmn2Q4R1vBCwb3
	 bE/EdVYRH12yJ/q66jeTWCC84i68o0r+RKf3lLqix7DKRmuA1Ll4ZVoTLTt2f0R0erpbj
	 3OkCPLFdOG4Rl3R7sNQ2UT/oMd+WfFJNCmZ7wOFQub6kdtnPtk8Jwj80HqctVAQ7JvVO4
	 7DYiRZdId6odz7Cqh+Iw5zhXZB+u0jyUSTGloYPm4CiHJoyGBagyyPDVsKk5oHSxIKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794822919;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=ALeSHsx30eLZ3CRWXR1RtD/2nxh7ufMDip6qkVreLtI=;
	b=BqcJABJm3tNHSZHsnmxb9khg3F+skJBjNNRrIEbwpijB2YU3bFXKv3fp84GTL7oK1+0Y
	 AwR36tZJ+IWtkyOECxMNqJ69gL2NzsjfHYtxNidwkg88y61hoZZP9nsU2ApBAYDvt1Ugm
	 whqJTClpQdj3y9OBGMsh7vfPfyozHXo1BwWtjXrW3lJ844Ab8xTjzVwL9bsAGJAtM5cTh
	 X34PZSIzzV0eNRlDxuNl2nyY0FAt8adKOjgyV2cxlpu54f2lJMIkNrKvmMupb7R32S50c
	 PWizoDQeTKBjZ3v0PLPxJBe0OfS/W5bkQkDNOhHeMoj5YuV4Ai9LZtR7SfOewReACoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b="g0n/7uSq";
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=cssHXGGZ;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EF16606A32C
	for <linux-next@vger.kernel.org>; Mon, 16 Nov 2026 09:55:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9EF16606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=g0n/7uSq;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=cssHXGGZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794822917;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=ALeSHsx30eLZ3CRWXR1RtD/2nxh7ufMDip6qkVreLtI=;
	b=g0n/7uSqmCyj9XePZleYfSC7LsPPH8U06D5NwNYjRgfb8PkftgZ0sJlDzjKAK3VkO7rcin
	0JXLyTB7GWTYznq/ruHeoYqHA+AKaaIcxrMGzg9pf9MpElO51iIsJbfrEb9dmff+g0Izt+
	B0uWbdDWzD8xx3tCtRNglCavFD6g13k=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-307-41iy3wH5OV-KKWZ7SE4G0g-1; Mon, 16 Nov 2026 04:55:16 -0500
X-MC-Unique: 41iy3wH5OV-KKWZ7SE4G0g-1
X-Mimecast-MFC-AGG-ID: 41iy3wH5OV-KKWZ7SE4G0g_1794822915
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-48e4d1e29f3so3104592f8f.3
        for <linux-next@vger.kernel.org>; Mon, 16 Nov 2026 01:55:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794822915; x=1795427715; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ALeSHsx30eLZ3CRWXR1RtD/2nxh7ufMDip6qkVreLtI=;
        b=cssHXGGZoZoWeZuHuBpH7DMWZnmafYy8CwUKUVYH4VefxCZiEKOHReZ4EyT/hFSrh9
         +PAh8d+tCwuFnDWbjyMOvDQPpLlRkrB5k4a2P83XrEWrBR7V+K5XUtt+pj+NLZhL8fww
         NCR5qq7kxHmJedLzfeQA1DWM1PwscgmRaLevv+9FPGtlrvJxahHZozoY+UrHGpLCTeJG
         s6YZs9mO5MYH3l9dE7LkgwZ2Ex2jiP9hbIpb2DTvEK5ixE5avbOOv1ARAWR4/B+KezU/
         drGPjtVdns5unS2VuYxdlEI0ceXK9blzGTlHyuxwuMfnxzC2gTSbrB2snTaBXuxF7R0O
         4PBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794822915; x=1795427715;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ALeSHsx30eLZ3CRWXR1RtD/2nxh7ufMDip6qkVreLtI=;
        b=u+0qyv8kEN8UDCxH39GOvXHu5sPjDsWLBwAa0qJFxuSIQz0RtS/Ql3hpioQUkwvOLa
         Ma86Puqs4abO2+IiH48oFbgWLUPRAMb4niLLyHdDRaEvUio6LEJtXQvoSXr9G7tU8c6p
         1Rggpi5jUmKxRvylJBgvFn7kmCdHEmoZHnh1cDBoebfAqJdDmdedJmCwL9Ns+uQQ0nCk
         VwYWxHBdFqTgJK8btsnYl2vOd8A+OrFC0Qtdg0v9thUJj4QC/phpm2ebGfQOts66F8Ri
         Am58lEY9+7a86guk8Dz1GPwnKgpT10Q2Bnd4hw5Eh3RmL/xCU1v/bLJiR5yMSczbahB8
         qkqg==
X-Forwarded-Encrypted: i=1; AL+hErGwI2IVvXNx9HkODR9WFL9X9cCrotkms+44a8mEUpKNwM8c1fibwxVG/rcQPNVdtRGIaTTsrngeoGch@vger.kernel.org
X-Gm-Message-State: APuU4Z9T4hiABtAK60XrJF4nIMyYiUFY7b/4Qr5oMpRviNOpL11UP8uJ
	d1JH6ayzatCxMGJ5vGpfOjvOn8Y0dizCxtjoPP/BlVJzWkJvlNYI/+zfcAj+g8q9fvl0jAeDbzJ
	1YuOKz/t1vKiDw3E1JMRGYEcPYxFDBID2QfzM1/KWF/G/wGFhH/dwPhiqNSIIA0I=
X-Gm-Gg: AZFdTZcbLbp8EjVdtfNzhpTE7pFYPEPyV/J/x6C/up4tp3JzoH4upcVq0KN6IPleq9R
	N8jbYrZWwChnYLs/pcCKHJLFwtmRIU5fh75LmxUiSJ58FTIUb2GkgEhnOKKgiy1ko4kD3+BTE7s
	nLSHzYiZbFhIVEjY222RqqB1GQE/BJ4wMOTe2ZV7QHPiwZR9CuF9LJonwTGdcSHXI075BME9fnz
	f4bRAeCs1ZcdjFKXH/2zI7iGQ62SdnsaJ+eM6AVDZ5UC51MqMVlXlHjl6QGvzLenTrMTqdp8+0x
	Vq4hB1QbZ4THyNbvnzvPv2wSEaaqT37k51ErMrTv8qq13k30coM/LgeejEtKO7OiYAfC3MbQL5V
	gIOnLnxu4LpKy5LZ5iYAxri8MpByeDZQ54RcKqJw0kX+B
X-Received: by 2002:a05:6000:1a8c:b0:48e:6812:5ef1 with SMTP id ffacd0b85a97d-49c713ae346mr21453785f8f.25.1794822915114;
        Mon, 16 Nov 2026 01:55:15 -0800 (PST)
X-Received: by 2002:a05:6000:1a8c:b0:48e:6812:5ef1 with SMTP id ffacd0b85a97d-49c713ae346mr21453746f8f.25.1794822914741;
        Mon, 16 Nov 2026 01:55:14 -0800 (PST)
Received: from [192.168.0.9] ([47.64.115.75])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5d223b21sm23653382f8f.2.2026.11.16.01.55.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 01:55:14 -0800 (PST)
Message-ID: <a2ccfd68-c773-416b-8aac-12a7f9caa801@redhat.com>
Date: Mon, 16 Nov 2026 10:55:12 +0100
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
Subject: Re: linux-next: build failure after merge of the asm-generic tree
To: Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-next <linux-next@vger.kernel.org>
References: <avcnFxad0xS5KrZs@sirena.org.uk>
 <cdd71b25-9149-476b-b31f-c29b3b2896b7@redhat.com>
 <c96b327e-959a-4363-bb39-f9e313c92b9b@app.fastmail.com>
Content-Language: en-US
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 xsFNBFH7eUwBEACzyOXKU+5Pcs6wNpKzrlJwzRl3VGZt95VCdb+FgoU9g11m7FWcOafrVRwU
 yYkTm9+7zBUc0sW5AuPGR/dp3pSLX/yFWsA/UB4nJsHqgDvDU7BImSeiTrnpMOTXb7Arw2a2
 4CflIyFqjCpfDM4MuTmzTjXq4Uov1giGE9X6viNo1pxyEpd7PanlKNnf4PqEQp06X4IgUacW
 tSGj6Gcns1bCuHV8OPWLkf4hkRnu8hdL6i60Yxz4E6TqlrpxsfYwLXgEeswPHOA6Mn4Cso9O
 0lewVYfFfsmokfAVMKWzOl1Sr0KGI5T9CpmRfAiSHpthhHWnECcJFwl72NTi6kUcUzG4se81
 O6n9d/kTj7pzTmBdfwuOZ0YUSqcqs0W+l1NcASSYZQaDoD3/SLk+nqVeCBB4OnYOGhgmIHNW
 0CwMRO/GK+20alxzk//V9GmIM2ACElbfF8+Uug3pqiHkVnKqM7W9/S1NH2qmxB6zMiJUHlTH
 gnVeZX0dgH27mzstcF786uPcdEqS0KJuxh2kk5IvUSL3Qn3ZgmgdxBMyCPciD/1cb7/Ahazr
 3ThHQXSHXkH/aDXdfLsKVuwDzHLVSkdSnZdt5HHh75/NFHxwaTlydgfHmFFwodK8y/TjyiGZ
 zg2Kje38xnz8zKn9iesFBCcONXS7txENTzX0z80WKBhK+XSFJwARAQABzR5UaG9tYXMgSHV0
 aCA8dGh1dGhAcmVkaGF0LmNvbT7CwXgEEwECACIFAlVgX6oCGwMGCwkIBwMCBhUIAgkKCwQW
 AgMBAh4BAheAAAoJEC7Z13T+cC21EbIP/ii9cvT2HHGbFRl8HqGT6+7Wkb+XLMqJBMAIGiQK
 QIP3xk1HPTsLfVG0ao4hy/oYkGNOP8+ubLnZen6Yq3zAFiMhQ44lvgigDYJo3Ve59gfe99KX
 EbtB+X95ODARkq0McR6OAsPNJ7gpEUzfkQUUJTXRDQXfG/FX303Gvk+YU0spm2tsIKPl6AmV
 1CegDljzjycyfJbk418MQmMu2T82kjrkEofUO2a24ed3VGC0/Uz//XCR2ZTo+vBoBUQl41BD
 eFFtoCSrzo3yPFS+w5fkH9NT8ChdpSlbNS32NhYQhJtr9zjWyFRf0Zk+T/1P7ECn6gTEkp5k
 ofFIA4MFBc/fXbaDRtBmPB0N9pqTFApIUI4vuFPPO0JDrII9dLwZ6lO9EKiwuVlvr1wwzsgq
 zJTPBU3qHaUO4d/8G+gD7AL/6T4zi8Jo/GmjBsnYaTzbm94lf0CjXjsOX3seMhaE6WAZOQQG
 tZHAO1kAPWpaxne+wtgMKthyPLNwelLf+xzGvrIKvLX6QuLoWMnWldu22z2ICVnLQChlR9d6
 WW8QFEpo/FK7omuS8KvvopFcOOdlbFMM8Y/8vBgVMSsK6fsYUhruny/PahprPbYGiNIhKqz7
 UvgyZVl4pBFjTaz/SbimTk210vIlkDyy1WuS8Zsn0htv4+jQPgo9rqFE4mipJjy/iboDzsFN
 BFH7eUwBEAC2nzfUeeI8dv0C4qrfCPze6NkryUflEut9WwHhfXCLjtvCjnoGqFelH/PE9NF4
 4VPSCdvD1SSmFVzu6T9qWdcwMSaC+e7G/z0/AhBfqTeosAF5XvKQlAb9ZPkdDr7YN0a1XDfa
 +NgA+JZB4ROyBZFFAwNHT+HCnyzy0v9Sh3BgJJwfpXHH2l3LfncvV8rgFv0bvdr70U+On2XH
 5bApOyW1WpIG5KPJlDdzcQTyptOJ1dnEHfwnABEfzI3dNf63rlxsGouX/NFRRRNqkdClQR3K
 gCwciaXfZ7ir7fF0u1N2UuLsWA8Ei1JrNypk+MRxhbvdQC4tyZCZ8mVDk+QOK6pyK2f4rMf/
 WmqxNTtAVmNuZIwnJdjRMMSs4W4w6N/bRvpqtykSqx7VXcgqtv6eqoDZrNuhGbekQA0sAnCJ
 VPArerAZGArm63o39me/bRUQeQVSxEBmg66yshF9HkcUPGVeC4B0TPwz+HFcVhheo6hoJjLq
 knFOPLRj+0h+ZL+D0GenyqD3CyuyeTT5dGcNU9qT74bdSr20k/CklvI7S9yoQje8BeQAHtdV
 cvO8XCLrpGuw9SgOS7OP5oI26a0548M4KldAY+kqX6XVphEw3/6U1KTf7WxW5zYLTtadjISB
 X9xsRWSU+Yqs3C7oN5TIPSoj9tXMoxZkCIHWvnqGwZ7JhwARAQABwsFfBBgBAgAJBQJR+3lM
 AhsMAAoJEC7Z13T+cC21hPAQAIsBL9MdGpdEpvXs9CYrBkd6tS9mbaSWj6XBDfA1AEdQkBOn
 ZH1Qt7HJesk+qNSnLv6+jP4VwqK5AFMrKJ6IjE7jqgzGxtcZnvSjeDGPF1h2CKZQPpTw890k
 fy18AvgFHkVk2Oylyexw3aOBsXg6ukN44vIFqPoc+YSU0+0QIdYJp/XFsgWxnFIMYwDpxSHS
 5fdDxUjsk3UBHZx+IhFjs2siVZi5wnHIqM7eK9abr2cK2weInTBwXwqVWjsXZ4tq5+jQrwDK
 cvxIcwXdUTLGxc4/Z/VRH1PZSvfQxdxMGmNTGaXVNfdFZjm4fz0mz+OUi6AHC4CZpwnsliGV
 ODqwX8Y1zic9viSTbKS01ZNp175POyWViUk9qisPZB7ypfSIVSEULrL347qY/hm9ahhqmn17
 Ng255syASv3ehvX7iwWDfzXbA0/TVaqwa1YIkec+/8miicV0zMP9siRcYQkyTqSzaTFBBmqD
 oiT+z+/E59qj/EKfyce3sbC9XLjXv3mHMrq1tKX4G7IJGnS989E/fg6crv6NHae9Ckm7+lSs
 IQu4bBP2GxiRQ+NV3iV/KU3ebMRzqIC//DCOxzQNFNJAKldPe/bKZMCxEqtVoRkuJtNdp/5a
 yXFZ6TfE1hGKrDBYAm4vrnZ4CXFSBDllL59cFFOJCkn4Xboj/aVxxJxF30bn
In-Reply-To: <c96b327e-959a-4363-bb39-f9e313c92b9b@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Am 13.11.26 um 17:16 schrieb Arnd Bergmann:
> On Fri, Nov 13, 2026, at 16:45, Thomas Huth wrote:
> __signed__ char __s8'
>>> /usr/include/asm-generic/int-ll64.h:21: Error: unknown mnemonic `typedef' -- `typedef unsigned char __u8'
> 1
>>>
>>> Caused by commit
>>>
>>>      625b37748a148 (treewide: Stop defining __ASSEMBLY__ for assembler files)
>>>
>>> I have used the tree from next-20261112 instead.
> 
>>
>> the fix is:
>>
>>    https://lore.kernel.org/lkml/20261030174323.370687-1-thuth@redhat.com/
>>
>> ... Arnd, could you pick it up into your tree, please?
> 
> Sorry about that, I had already applied it locally but forgot to push
> out the updated branch. Pushed now.
> 
> There was another report for the 0day build bot about the same error
> on powerpc, but not enough information for me to reproduce, so it's
> possible that we need another fix like this.
I was finally able to get access to a ppc64 machine and tried to reproduce 
the problem. But it was just the vdso_test_chacha test again that was 
failing there due to the __ASSEMBLY__ still being used in /usr/include, i.e. 
the same problem that we saw on aarch64. I double checked that it gets fixed 
after applying 
https://lore.kernel.org/lkml/20261030174323.370687-1-thuth@redhat.com/ , so 
unless the 0day bot had a very unusal setup, I think we should be fine.

  Thomas

