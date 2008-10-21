From: Josh Boyer <jwboyer@linux.vnet.ibm.com>
Subject: Re: linux-next: Tree for October 21
Date: Tue, 21 Oct 2008 09:02:01 -0400
Message-ID: <20081021130201.GB31686@yoda.jdub.homelinux.org>
References: <20081021195109.ed83b102.sfr@canb.auug.org.au> <20081021120735.GA10567@yoda.jdub.homelinux.org> <20081021231421.a9cdfcb4.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-gx0-f16.google.com ([209.85.217.16]:33500 "EHLO
	mail-gx0-f16.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751965AbYJUNDe (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 21 Oct 2008 09:03:34 -0400
Received: by gxk9 with SMTP id 9so5364517gxk.13
        for <linux-next@vger.kernel.org>; Tue, 21 Oct 2008 06:03:33 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20081021231421.a9cdfcb4.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Tue, Oct 21, 2008 at 11:14:21PM +1100, Stephen Rothwell wrote:
>Hi Josh,
>
>On Tue, 21 Oct 2008 08:07:35 -0400 Josh Boyer <jwboyer@linux.vnet.ibm.com> wrote:
>>
>> On Tue, Oct 21, 2008 at 07:51:09PM +1100, Stephen Rothwell wrote:
>> >I have also applied the following patches for known problems:
>> >
>> >	sparc: qlogicpti fallout from sbus removal
>> >	ibm_newemac: Fix new MAL feature handling
>> 
>> Did you?  I put that in my next branch, which Ben pulled into his powerpc
>> tree, so it shouldn't have needed applying separately.
>
>It got into Ben's tree way after I started building linux-next for
>today.  Tomorrow I will indeed not need it any more, thanks.

Ah.  I sort of guessed that after I sent out my first mail.  Silly me
for emailing before coffee again.

josh
