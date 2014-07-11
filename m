From: Peter Hurley <peter@hurleysoftware.com>
Subject: Re: linux-next: build failure after merge of the tty.current tree
Date: Fri, 11 Jul 2014 11:06:56 -0400
Message-ID: <53BFFD90.5010405@hurleysoftware.com>
References: <20140711112108.7631911b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mailout32.mail01.mtsvc.net ([216.70.64.70]:54584 "EHLO
	n23.mail01.mtsvc.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1752301AbaGKPHA (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 11 Jul 2014 11:07:00 -0400
In-Reply-To: <20140711112108.7631911b@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On 07/10/2014 09:21 PM, Stephen Rothwell wrote:
> Hi Greg,
>
> After merging the tty.current tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
[...]
> Caused by commit c557d392fbf5 ("serial: Test for no tx data on tx
> restart").  That can't have been build tested :-(

Sorry about that. I don't have a full cross-compiler setup for
build testing. Looks like that's something I'm going to have to add.

Regards,
Peter Hurley
