From: "Grant Likely" <grant.likely@secretlab.ca>
Subject: Re: linux-next: manual merge of the powerpc tree
Date: Thu, 3 Jul 2008 23:54:26 -0600
Message-ID: <fa686aa40807032254j76dd1892y7af76c1a2d555809@mail.gmail.com>
References: <20080703133905.7b6f058f.sfr@canb.auug.org.au>
	 <20080703054739.GA643@secretlab.ca>
	 <9e4733910807030522h1aa0bl1801ecc5fc877c25@mail.gmail.com>
	 <20080703152453.GB2284@secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ag-out-0708.google.com ([72.14.246.244]:46873 "EHLO
	ag-out-0708.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751502AbYGDFy3 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 4 Jul 2008 01:54:29 -0400
Received: by ag-out-0708.google.com with SMTP id 31so7079192agc.10
        for <linux-next@vger.kernel.org>; Thu, 03 Jul 2008 22:54:27 -0700 (PDT)
In-Reply-To: <20080703152453.GB2284@secretlab.ca>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jon Smirl <jonsmirl@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, galak@kernel.crashing.org, Paul Mackerras <paulus@samba.org>, linuxppc-dev@ozlabs.org, Jean Delvare <khali@linux-fr.org>, linux-next@vger.kernel.org, Timur Tabi <timur@freescale.com>

On Thu, Jul 3, 2008 at 9:24 AM, Grant Likely <grant.likely@secretlab.ca> wrote:
> On Thu, Jul 03, 2008 at 08:22:18AM -0400, Jon Smirl wrote:
>> Testing was good when the patch was initially posted in January. In
>> the last six months the initial patch set has been sliced and diced
>> into a bunch of different pieces but the contents of this patch are
>> essentially unchanged.
>>
>> I don't care which tree it uses to get to mainline, I'd just like to
>> see it get merged.
>
> Me too, but it is used by some of the mpc8xxx platforms too, so I'd like
> to see an ack from one of those users also.

Okay, I've tested it on my board.  All looks good to me.  I'd prefer
to hear back from one of the Freescale folks, but on a second reading
I think it is pretty safe.  I'll make sure any merge conflicts are
resolved.

Jean, is it okay with you to drop it from your tree and merge it through mine?

Cheers,
g.

-- 
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
