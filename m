From: Bart Van Assche <bvanassche@acm.org>
Subject: Re: linux-next: upcoming conflict between the target-updates and
        target-bva trees
Date: Thu, 1 Jun 2017 21:55:47 -0700
Message-ID: <1e3679b7-2812-8916-92f8-09d9cbd6deea@acm.org>
References: <20170602133928.2afa3e7a@canb.auug.org.au>
        <1496376224.27407.228.camel@haakon3.risingtidesystems.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bxl-001.se.1eurohost.be ([87.238.167.208]:55107 "EHLO
        bxl-001.se.1eurohost.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750747AbdFBFMK (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 2 Jun 2017 01:12:10 -0400
In-Reply-To: <1496376224.27407.228.camel@haakon3.risingtidesystems.com>
Content-Language: en-US
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Nicholas A. Bellinger" <nab@linux-iscsi.org>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On 06/01/17 21:03, Nicholas A. Bellinger wrote:
> On Fri, 2017-06-02 at 13:39 +1000, Stephen Rothwell wrote:
>> Last night the target-bva tree was rebased on top of the target-updates
>> tree.  Just now, part of the target-updates tree has been rewritten.
>> So now I expect to get conflict(s) when I merge these trees since the
>> commits in the target-updates tree are no longer the same as those that
>> the target-bva tree was rebased on top of.
>>
>> Please take a little time to sort out your development process.
> 
> Unfortunately, this is going to continue to be a problem once these
> patches are list reviewed, and included in target-updates.
> 
> Bart, can you please drop the patches?
Hello Stephen and Nic,

I have just reset that branch to v4.12-rc1. Sorry for the inconvenience.

Bart.
