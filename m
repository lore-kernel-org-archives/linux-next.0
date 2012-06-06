From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: linux-next: Tree for Jun 5 (amd64_edac)
Date: Wed, 06 Jun 2012 14:30:01 -0700
Message-ID: <4FCFCBD9.8080700@xenotime.net>
References: <20120605133000.f2d21fb02881ef54a7bfe728@canb.auug.org.au> <4FCE333F.6060207@xenotime.net> <4FCE4408.1030506@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from oproxy9.bluehost.com ([69.89.24.6]:59234 "HELO
	oproxy9.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1755620Ab2FFVaM (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 6 Jun 2012 17:30:12 -0400
In-Reply-To: <4FCE4408.1030506@redhat.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mauro Carvalho Chehab <mchehab@redhat.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Doug Thompson <dougthompson@xmission.com>, Borislav Petkov <borislav.petkov@amd.com>, linux-edac@vger.kernel.org

On 06/05/2012 10:38 AM, Mauro Carvalho Chehab wrote:

> Hi Randy,
> 
> Em 05-06-2012 13:26, Randy Dunlap escreveu:
>> On 06/04/2012 08:30 PM, Stephen Rothwell wrote:
>>
>>> Hi all,
>>>
>>> There will be no linux-next release tomorrow.
>>>
>>> Changes since 20120604:
>>
>>
>>
>> on x86_64:
>>
>> drivers/edac/amd64_edac_inj.o: In function `amd64_remove_sysfs_dbg_files':
>> amd64_edac_inj.c:(.text+0x420): multiple definition of `amd64_remove_sysfs_dbg_files'
>> drivers/edac/amd64_edac.o:amd64_edac.c:(.text+0x3d60): first defined here
>> make[3]: *** [drivers/edac/amd64_edac_mod.o] Error 1
>>
>>
>> Full randconfig file is attached.
>>
>>
> 
> Thanks for pointing it. The enclosed patch should fix it.
> 
> amd64_edac: Avoid compilation breakage
> 
> when:
> 	CONFIG_EDAC_AMD64=m
> 	CONFIG_EDAC_AMD64_ERROR_INJECTION=y
> 	# CONFIG_EDAC_DEBUG is not set
> 
> The compilation breaks, as amd64_remove_sysfs_dbg_files() were not declared
> as static.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@redhat.com>


Acked-by: Randy Dunlap <rdunlap@xenotime.net>

Thanks.

> 
> diff --git a/drivers/edac/amd64_edac.h b/drivers/edac/amd64_edac.h
> index 098f336..8d48047 100644
> --- a/drivers/edac/amd64_edac.h
> +++ b/drivers/edac/amd64_edac.h
> @@ -421,7 +421,7 @@ static inline int amd64_create_sysfs_dbg_files(struct mem_ctl_info *mci)
>  {
>  	return 0;
>  }
> -void inline amd64_remove_sysfs_dbg_files(struct mem_ctl_info *mci)
> +static void inline amd64_remove_sysfs_dbg_files(struct mem_ctl_info *mci)
>  {
>  }
>  #endif
> --


-- 
~Randy
