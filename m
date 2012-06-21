From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: mmotm 2012-06-21-16-20 uploaded
Date: Thu, 21 Jun 2012 16:34:58 -0700
Message-ID: <20120621163458.89459d7a.akpm@linux-foundation.org>
References: <20120621232149.F0286A026A@akpm.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:38065 "EHLO
	mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759600Ab2FUXe7 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 21 Jun 2012 19:34:59 -0400
In-Reply-To: <20120621232149.F0286A026A@akpm.mtv.corp.google.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org, linux-next@vger.kernel.org

On Thu, 21 Jun 2012 16:21:49 -0700
akpm@linux-foundation.org wrote:

> The mm-of-the-moment snapshot 2012-06-21-16-20 has been uploaded to
> 
>    http://www.ozlabs.org/~akpm/mmotm/

Exciting updates to http://www.ozlabs.org/~akpm/mmotm/mmotm-readme.txt:

: The directory http://www.ozlabs.org/~akpm/mmots/ (mm-of-the-second)
: contains daily snapshots of the -mm tree.  It is updated more frequently
: than mmotm, and is untested.

It takes me 1.5 hours to 1.5 days to do a -mm release, depending on how
many screwups people have been merging and sending.  This makes the
releases less frequent than I'd like.

So I will do daily dumps of the -mm patches into
http://www.ozlabs.org/~akpm/mmots/.  They are the same as the mmotm
patches (use the same script), except they will be unannounced and
untested.
