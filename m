From: Tejun Heo <tj@kernel.org>
Subject: Re: [BUG -next] sysfs change breaks userspace
Date: Thu, 31 Oct 2013 13:25:06 -0400
Message-ID: <20131031172506.GE11698@mtj.dyndns.org>
References: <20131031114358.GA5551@osiris>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-yh0-f49.google.com ([209.85.213.49]:62944 "EHLO
	mail-yh0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752769Ab3JaRbE (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 31 Oct 2013 13:31:04 -0400
Received: by mail-yh0-f49.google.com with SMTP id a41so1350877yho.36
        for <linux-next@vger.kernel.org>; Thu, 31 Oct 2013 10:31:03 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20131031114358.GA5551@osiris>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Heiko Carstens <heiko.carstens@de.ibm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kay Sievers <kay@vrfy.org>, linux-next@vger.kernel.org

Hello, Heiko.

On Thu, Oct 31, 2013 at 12:43:58PM +0100, Heiko Carstens wrote:
> Hi Tejun,
> 
> I just tried out linux-next and my network doesn't come up anymore.
> Userspace fails like this:
> 
> network[2211]: Bringing up interface eth0:  sysfs read broadcast value: Invalid argument
> 
> I bisected that down to:
> 
> commit 13c589d5b0ac654d9da7e490a2dd548e6b86b4a5
> Author: Tejun Heo <tj@kernel.org>
> Date:   Tue Oct 1 17:42:02 2013 -0400
> 
>     sysfs: use seq_file when reading regular files

Heh, intereting.  The content doesn't change over multiple show
invocations, so the behavior shouldn't change at all for the attribute
and seq_file handles seeking and partial reads correctly.  No idea
what could go wrong there.  It probably was reading
/sys/devices/BLAHBLAH/net/NETIF/broadcast file.  Can you please locate
the file and do "ls -l" and "cat" on it?  If that looks normal, can
you please strace the network interface config program / script /
whatever?  BTW, what are you running on the system?

Thanks.

-- 
tejun
