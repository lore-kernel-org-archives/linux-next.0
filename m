From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
Date: Thu, 16 Jul 2015 11:59:32 -0700
Message-ID: <20150716115932.5e639917.akpm@linux-foundation.org>
References: <20150716152036.3551cef7@canb.auug.org.au>
	<55A7C18B.7030104@akamai.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:60944 "EHLO
	mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752055AbbGPS7t (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 16 Jul 2015 14:59:49 -0400
In-Reply-To: <55A7C18B.7030104@akamai.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Eric B Munson <emunson@akamai.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, 16 Jul 2015 10:36:59 -0400 Eric B Munson <emunson@akamai.com> wrote:

> I have an updated set that addresses the build failures by completing
> the system call additions.  It does not yet address Jon's concern
> about applying MLOCK_ONFAULT to a region with pages that are already
> present (this is in progress).
> 
> Do you want the updated syscalls now or wait until the whole thing is
> ready?

When it's ready, please.
