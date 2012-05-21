From: Lee Jones <lee.jones@linaro.org>
Subject: Re: linux-next: build failure after merge of the mfd tree
Date: Mon, 21 May 2012 10:01:20 +0100
Message-ID: <4FBA0460.1070300@linaro.org>
References: <20120521134219.6d6396802bd6a097503bac92@canb.auug.org.au> <4FB9F818.4030801@linaro.org> <20120521184005.3b7661ec6468c5878a22615d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-lpp01m010-f46.google.com ([209.85.215.46]:45898 "EHLO
	mail-lpp01m010-f46.google.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S932084Ab2EUJB2 (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Mon, 21 May 2012 05:01:28 -0400
Received: by lahd3 with SMTP id d3so3296388lah.19
        for <linux-next@vger.kernel.org>; Mon, 21 May 2012 02:01:27 -0700 (PDT)
In-Reply-To: <20120521184005.3b7661ec6468c5878a22615d@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Samuel Ortiz <sameo@linux.intel.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On 21/05/12 09:40, Stephen Rothwell wrote:
> Hi Lee,
>
> On Mon, 21 May 2012 09:08:56 +0100 Lee Jones<lee.jones@linaro.org>  w=
rote:
>>
>> The patch itself has had extensive build and run testing, with DT bo=
th
>> enabled and disabled. I'm guessing some other changes may be having =
and
>> influence here. I'm happy to take a look for you. Can you tell me wh=
ere
>> I can pull the offending branch from please?
>
> The mfd tree can be found here:
>
> git://git.kernel.org/pub/scm/linux/kernel/git/sameo/mfd-2.6.git#for-n=
ext
>
> Did you try building it for X86_64?  What failed for me was an x86_64
> allmodconfig.

That seems broken to me.

Why would any of the X86_64 systems be building ab8500-core code?

--=20
Lee Jones
Linaro ST-Ericsson Landing Team Lead
M: +44 77 88 633 515
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
