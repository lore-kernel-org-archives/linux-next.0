From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
Date: Tue, 6 Sep 2016 09:27:55 +1000
Message-ID: <20160906092755.1e159de9@canb.auug.org.au>
References: <20160905191917.4ca6dd56@canb.auug.org.au>
        <8826558.sWXQPuNUpI@hactar>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:53022 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753581AbcIEX15 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 5 Sep 2016 19:27:57 -0400
In-Reply-To: <8826558.sWXQPuNUpI@hactar>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thiago Jung Bauermann <bauerman@linux.vnet.ibm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Thiago,

On Mon, 05 Sep 2016 14:49:12 -0300 Thiago Jung Bauermann <bauerman@linux.vnet.ibm.com> wrote:
>
> Sorry about that. The change below to arch/powerpc/purgatory/Makefile
> fixes the cross build from ppc64 BE to ppc64 LE.
> 
> I also noticed that building the purgatory during archprepare is not necessary,
> so I also made the change below to arch/powerpc/Makefile.
> 
> I'm preparing a v8 of the kexec_file_load implementation for powerpc series
> with those changes and will send it shortly.

OK, so I have applied that patch to Andrew's tree for today.
-- 
Cheers,
Stephen Rothwell
