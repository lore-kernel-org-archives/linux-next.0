From: Chris Metcalf <cmetcalf@tilera.com>
Subject: Re: Building tilegx defconfig gets init/exit section errors in xfs.
Date: Mon, 26 Mar 2012 18:12:58 -0400
Message-ID: <4F70E9EA.5010207@tilera.com>
References: <4F6F61F3.40903@windriver.com> <20120326215919.GN5091@dastard> <4F70E951.50009@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from usmamail.tilera.com ([206.83.70.75]:40457 "EHLO
	USMAMAIL.TILERA.COM" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757610Ab2CZWNA (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 26 Mar 2012 18:13:00 -0400
In-Reply-To: <4F70E951.50009@windriver.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: Dave Chinner <david@fromorbit.com>, xfs@oss.sgi.com, linux-next@vger.kernel.org, bpm@sgi.com

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
> Already been reported, a patch has been provided, too. So the fix
> is underway.
>
> Thanks for reporting the problem anyway, Paul.

And I'll second that with my thanks for adding tilegx to the linux-next
build coverage!  Please do continue to cc me on any issues that are exposed.

-- 
Chris Metcalf, Tilera Corp.
http://www.tilera.com
