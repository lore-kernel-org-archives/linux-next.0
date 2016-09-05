From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: please clean up the thermal-soc tree
Date: Tue, 6 Sep 2016 09:34:31 +1000
Message-ID: <20160906093431.45b64fe8@canb.auug.org.au>
References: <20160822114346.4cb45ec5@canb.auug.org.au>
        <20160905130333.GA21673@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:34749 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753732AbcIEXef (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 5 Sep 2016 19:34:35 -0400
In-Reply-To: <20160905130333.GA21673@localhost.localdomain>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Eduardo Valentin <edubezval@gmail.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Zhang Rui <rui.zhang@intel.com>

Hi Eduardo,

On Mon, 5 Sep 2016 06:03:35 -0700 Eduardo Valentin <edubezval@gmail.com> wrote:
>
> On Mon, Aug 22, 2016 at 11:43:46AM +1000, Stephen Rothwell wrote:
> > Hi Eduardo,
> > 
> > The thermal-soc tree now shares quite a few patches (but not commits)
> > with the thermal tree.  These are causing a few unnecessary conflicts,
> > so please clean it up.  
> 
> I had to be out for several weeks and my tree was broken during this
> time causing the above problem. Sorry for this.
> 
> I have removed the problematic patches out of linux-next way.

Thanks for that.

-- 
Cheers,
Stephen Rothwell
