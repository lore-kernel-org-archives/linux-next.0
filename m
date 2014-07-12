From: Peter Hurley <peter@hurleysoftware.com>
Subject: Re: linux-next: build failure after merge of the tty.current tree
Date: Sat, 12 Jul 2014 09:02:34 -0400
Message-ID: <53C131EA.2020502@hurleysoftware.com>
References: <20140711112108.7631911b@canb.auug.org.au>	<53BFFD90.5010405@hurleysoftware.com> <20140712112012.69befaf0@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mailout32.mail01.mtsvc.net ([216.70.64.70]:41902 "EHLO
	n23.mail01.mtsvc.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1752044AbaGLNCp (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 12 Jul 2014 09:02:45 -0400
In-Reply-To: <20140712112012.69befaf0@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Greg KH <greg@kroah.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On 07/11/2014 09:20 PM, Stephen Rothwell wrote:
> Hi Peter,
>
> On Fri, 11 Jul 2014 11:06:56 -0400 Peter Hurley <peter@hurleysoftware.com> wrote:
>>
>> Sorry about that. I don't have a full cross-compiler setup for
>> build testing. Looks like that's something I'm going to have to add.
>
> see https://www.kernel.org/pub/tools/crosstool/
>
> These are only good for building the kernel (no libc).
>
> You don't necessarily need to build the whole kernel but often just
> building the particular drivers is enough.  Especially if they are
> directly modified ...

Hi Stephen,

Thanks for the link. I had found Shuah Khan's slideshow pdf on cross-compiler
packages earlier and so have already started down that path.

Regards,
Peter Hurley
