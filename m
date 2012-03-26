From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Re: Building tilegx defconfig gets init/exit section errors in xfs.
Date: Mon, 26 Mar 2012 18:10:25 -0400
Message-ID: <4F70E951.50009@windriver.com>
References: <4F6F61F3.40903@windriver.com> <20120326215919.GN5091@dastard>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail1.windriver.com ([147.11.146.13]:34156 "EHLO
	mail1.windriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756251Ab2CZWLZ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 26 Mar 2012 18:11:25 -0400
In-Reply-To: <20120326215919.GN5091@dastard>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dave Chinner <david@fromorbit.com>
Cc: xfs@oss.sgi.com, linux-next@vger.kernel.org, cmetcalf@tilera.com, bpm@sgi.com

On 12-03-26 05:59 PM, Dave Chinner wrote:
> On Sun, Mar 25, 2012 at 02:20:35PM -0400, Paul Gortmaker wrote:
>> Hi All,
>>
>> Recently the tilegx defconfig was added to the linux-next build
>> coverage, which exposed this.
>>  
>> LD      .tmp_vmlinux1
>> `xfs_qm_exit' referenced in section `.init.text' of fs/built-in.o:
>>  defined in discarded section `.exit.text' of fs/built-in.o
>> make[1]: *** [.tmp_vmlinux1] Error 1
>>
>> http://kisskb.ellerman.id.au/kisskb/buildresult/5941293/
>>
>> It seemed odd to me, since I didn't think there was anything arch
>> specific in the init/exit sectioning, so I thought I'd mention it
>> here, just in case it hasn't been brought up before.
> 
> Already been reported, a patch has been provided, too. So the fix
> is underway.
> 
> Thanks for reporting the problem anyway, Paul.

Thanks Dave, Ben - seems gmane archive isn't easily searchable, but
the nabble one is.  I'll add this link to the linux-next triage
report until the fix appears in a linux-next build:

http://old.nabble.com/-PATCH--fs%3A-xfs%3A-fix-section-mismatch-in-linux-next-td33519270.html

And next time I'll try harder to search a useful archive.  :)

Paul.


> 
> Cheers,
> 
> Dave.
