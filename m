From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: error when fetching the c6x tree
Date: Thu, 21 Apr 2016 10:01:27 +1000
Message-ID: <20160421100127.5aa069b9@canb.auug.org.au>
References: <20160420073632.626a8b3b@canb.auug.org.au>
	<1461162837.3897.4.camel@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:46134 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751188AbcDUABa (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 20 Apr 2016 20:01:30 -0400
In-Reply-To: <1461162837.3897.4.camel@redhat.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Salter <msalter@redhat.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Mark,

On Wed, 20 Apr 2016 10:33:57 -0400 Mark Salter <msalter@redhat.com> wrote:
>
> On Wed, 2016-04-20 at 07:36 +1000, Stephen Rothwell wrote:
> > 
> > Attempting to fetch the c6x tree
> > (git://linux-c6x.org/git/projects/linux-c6x-upstreaming.git#for-linux-next)
> > produced this error:
> > 
> > fatal: Could not read from remote repository.
> > 
> > Please make sure you have the correct access rights
> > and the repository exists.
> >   
> 
> Thanks Stephen. It looks like there was some transient network issue
> on the server end. It seems to be working now.

I got the error again this morning.

-- 
Cheers,
Stephen Rothwell
