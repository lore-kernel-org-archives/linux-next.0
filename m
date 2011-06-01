From: Tejun Heo <tj@kernel.org>
Subject: Re: linux-next: clean up time (pass 1)
Date: Wed, 1 Jun 2011 10:12:15 +0900
Message-ID: <20110601011215.GA16661@mtj.dyndns.org>
References: <20110601110616.861247de.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pv0-f174.google.com ([74.125.83.174]:62960 "EHLO
	mail-pv0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933005Ab1FABMX (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 31 May 2011 21:12:23 -0400
Content-Disposition: inline
In-Reply-To: <20110601110616.861247de.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

Hello, Stephen.

On Wed, Jun 01, 2011 at 11:06:16AM +1000, Stephen Rothwell wrote:
> slabh

This definitely is a dead branch.  It was a temporary testing branch
preparing for wide-scale update and the whole thing has been in
mainline for a very long time now.  Sorry about not updating it
earlier.

Thank you.

-- 
tejun
