From: Mark Salter <msalter@redhat.com>
Subject: Re: linux-next: error when fetching the c6x tree
Date: Wed, 20 Apr 2016 10:33:57 -0400
Message-ID: <1461162837.3897.4.camel@redhat.com>
References: <20160420073632.626a8b3b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:33628 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752900AbcDTOeA (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 20 Apr 2016 10:34:00 -0400
In-Reply-To: <20160420073632.626a8b3b@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, 2016-04-20 at 07:36 +1000, Stephen Rothwell wrote:
> Hi Mark,
> 
> Attempting to fetch the c6x tree
> (git://linux-c6x.org/git/projects/linux-c6x-upstreaming.git#for-linux-next)
> produced this error:
> 
> fatal: Could not read from remote repository.
> 
> Please make sure you have the correct access rights
> and the repository exists.
> 

Thanks Stephen. It looks like there was some transient network issue
on the server end. It seems to be working now.
