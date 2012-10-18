From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: linux-next: manual merge of the m68knommu tree with the  tree
Date: Thu, 18 Oct 2012 13:34:08 +1000
Message-ID: <507F78B0.70808@snapgear.com>
References: <20121018103713.0ccb63374964501c3d8d99a5@canb.auug.org.au> <20121018103826.c8e1312904747b31caa376f6@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from dalsmrelay2.nai.com ([205.227.136.216]:17162 "EHLO
	dalsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751420Ab2JRDap (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 17 Oct 2012 23:30:45 -0400
In-Reply-To: <20121018103826.c8e1312904747b31caa376f6@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, David Howells <dhowells@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>

Hi Stephen,

On 18/10/12 09:38, Stephen Rothwell wrote:
> [Just cc'ing Geert]
>
> On Thu, 18 Oct 2012 10:37:13 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>
>> Hi Greg,
>>
>> Today's linux-next merge of the m68knommu tree got conflicts in
>> arch/m68k/include/asm/termios.h, arch/m68k/include/uapi/asm/auxvec.h,
>> arch/m68k/include/uapi/asm/msgbuf.h, arch/m68k/include/uapi/asm/sembuf.h,
>> arch/m68k/include/uapi/asm/shmbuf.h, arch/m68k/include/uapi/asm/socket.h,
>> arch/m68k/include/uapi/asm/sockios.h and
>> arch/m68k/include/uapi/asm/termbits.h between commit 10b3a979347d ("UAPI:
>> (Scripted) Disintegrate arch/m68k/include/asm") from the m68k-current
>> tree and various commits from the m68knommu tree that use the asm-generic
>> versions.
>>
>> I just deleted all those files and added the following merge fix patch
>> and can carry the fix as necessary.
>>
>> I think that this is the correct thing to do ...

I think that is right. Thanks.

Regards
Greg


>> From: Stephen Rothwell <sfr@canb.auug.org.au>
>> Date: Thu, 18 Oct 2012 10:32:20 +1100
>> Subject: [PATCH] m68k: fix up for UAPI changes
>>
>> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
>> ---
>>   arch/m68k/include/uapi/asm/Kbuild |    8 --------
>>   1 file changed, 8 deletions(-)
>>
>> diff --git a/arch/m68k/include/uapi/asm/Kbuild b/arch/m68k/include/uapi/asm/Kbuild
>> index 972bce1..aebdbf5 100644
>> --- a/arch/m68k/include/uapi/asm/Kbuild
>> +++ b/arch/m68k/include/uapi/asm/Kbuild
>> @@ -2,25 +2,17 @@
>>   include include/uapi/asm-generic/Kbuild.asm
>>
>>   header-y += a.out.h
>> -header-y += auxvec.h
>>   header-y += byteorder.h
>>   header-y += cachectl.h
>>   header-y += fcntl.h
>>   header-y += ioctls.h
>> -header-y += msgbuf.h
>>   header-y += param.h
>>   header-y += poll.h
>>   header-y += posix_types.h
>>   header-y += ptrace.h
>> -header-y += sembuf.h
>>   header-y += setup.h
>> -header-y += shmbuf.h
>>   header-y += sigcontext.h
>>   header-y += signal.h
>> -header-y += socket.h
>> -header-y += sockios.h
>>   header-y += stat.h
>>   header-y += swab.h
>> -header-y += termbits.h
>> -header-y += termios.h
>>   header-y += unistd.h
>> --
>> 1.7.10.280.gaa39
>


-- 
------------------------------------------------------------------------
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.com
SnapGear Group, McAfee                      PHONE:       +61 7 3435 2888
8 Gardner Close                             FAX:         +61 7 3217 5323
Milton, QLD, 4064, Australia                WEB: http://www.SnapGear.com
