From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: error while fetching the microblaze tree
Date: Wed, 20 Sep 2017 09:26:00 +1000
Message-ID: <20170920092600.716baffd@canb.auug.org.au>
References: <20160107093856.779af583@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:40003 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751521AbdISX0D (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 19 Sep 2017 19:26:03 -0400
In-Reply-To: <20160107093856.779af583@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Michal Simek <monstr@monstr.eu>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Michal,

On Thu, 7 Jan 2016 09:38:56 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Fetching the microblaze tree
> (git://git.monstr.eu/linux-2.6-microblaze.git#next) produces this error.
> 
> fatal: read error: Connection reset by peer
> 
> I will use the previously fetched version for today.

I have been unable to fetch the microblaze tree again for the past few
days.  This time it is is getting:

git.monstr.eu[0: 195.88.143.27]: errno=Connection refused

-- 
Cheers,
Stephen Rothwell
