From: Eduardo Valentin <edubezval@gmail.com>
Subject: Re: linux-next: please clean up the thermal-soc tree
Date: Mon, 5 Sep 2016 06:03:35 -0700
Message-ID: <20160905130333.GA21673@localhost.localdomain>
References: <20160822114346.4cb45ec5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pf0-f174.google.com ([209.85.192.174]:33404 "EHLO
        mail-pf0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932127AbcIENDi (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 5 Sep 2016 09:03:38 -0400
Content-Disposition: inline
In-Reply-To: <20160822114346.4cb45ec5@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Zhang Rui <rui.zhang@intel.com>

Stephen,

On Mon, Aug 22, 2016 at 11:43:46AM +1000, Stephen Rothwell wrote:
> Hi Eduardo,
> 
> The thermal-soc tree now shares quite a few patches (but not commits)
> with the thermal tree.  These are causing a few unnecessary conflicts,
> so please clean it up.

I had to be out for several weeks and my tree was broken during this
time causing the above problem. Sorry for this.

I have removed the problematic patches out of linux-next way.

Let me know if you still have troubles.

BR,

Eduardo Valentin

> 
> -- 
> Cheers,
> Stephen Rothwell
