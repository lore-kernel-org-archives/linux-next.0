From: Vincent <vincent.stehle@laposte.net>
Subject: Re: [PATCH] topology: Fix compilation warning when not in SMP
Date: Sat, 05 Apr 2014 14:30:27 +0200
Message-ID: <533FF763.3020000@bergerie>
References: <1396593798-29173-1-git-send-email-vincent.stehle@laposte.net> <20140404234943.GA14633@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp2-g21.free.fr ([212.27.42.2]:48270 "EHLO smtp2-g21.free.fr"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752528AbaDEMah (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sat, 5 Apr 2014 08:30:37 -0400
In-Reply-To: <20140404234943.GA14633@kroah.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org

On 04/05/2014 01:49 AM, Greg Kroah-Hartman wrote:
> Warnings aren't a stable kernel issue, so why would this be relevant
> there?

Oh, sorry about that. I'll go re-read the stable kernel rules again.

Shall I re-post without the stable Cc:, for only mainline and next?

Best regards,

V.
