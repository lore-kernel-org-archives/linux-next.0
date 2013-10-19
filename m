From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Oct 15 (asymmetric keys)
Date: Sat, 19 Oct 2013 10:07:28 -0700
Message-ID: <5262BC50.4070004@infradead.org>
References: <1381845763-10487-1-git-send-email-treding@nvidia.com> <525DC4FB.4010305@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from merlin.infradead.org ([205.233.59.134]:40556 "EHLO
	merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751921Ab3JSRHa (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 19 Oct 2013 13:07:30 -0400
In-Reply-To: <525DC4FB.4010305@infradead.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, David Howells <dhowells@redhat.com>

On 10/15/13 15:43, Randy Dunlap wrote:
> On 10/15/13 07:02, Thierry Reding wrote:
>> Hi all,
>>
>> I've uploaded today's linux-next tree to the master branch of the
>> repository below:
>>
>>         git://gitorious.org/thierryreding/linux-next.git
>>
>> A next-20131015 tag is also provided for convenience.
> 
> on x86_64:
> 
> crypto/asymmetric_keys/x509_public_key.c: In function 'x509_key_preparse':
> crypto/asymmetric_keys/x509_public_key.c:237:35: error: 'system_trusted_keyring' undeclared (first use in this function)
> 
> when CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE=m
> and  CONFIG_SYSTEM_TRUSTED_KEYRING is not set.
> 
> 
> Full randconfig file is attached.
> 

Hi David,
Do you want me to fix this build error?
(You might not like my fix. :)

thanks,


-- 
~Randy
