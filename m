From: Peter Hurley <peter@hurleysoftware.com>
Subject: Re: [PATCH] TTY:vt: convert remain take_over_console's users to do_take_over_console
Date: Tue, 21 May 2013 13:45:01 -0400
Message-ID: <519BB29D.9010104@hurleysoftware.com>
References: <20130521051511.GA11435@udknight> <519B7249.2070207@hurleysoftware.com> <20130521144215.GA5302@udknight.homenetwork> <519B976A.3050708@hurleysoftware.com> <20130521161849.GA11322@udknight.homenetwork> <20130521162958.GA1927@udknight>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mailout39.mail01.mtsvc.net ([216.70.64.83]:49714 "EHLO
	n12.mail01.mtsvc.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1754878Ab3EURpG (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 21 May 2013 13:45:06 -0400
In-Reply-To: <20130521162958.GA1927@udknight>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Wang YanQing <udknight@gmail.com>
Cc: gregkh@linuxfoundation.org, sfr@canb.auug.org.au, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On 05/21/2013 12:29 PM, Wang YanQing wrote:
> On Wed, May 22, 2013 at 12:18:49AM +0800, Wang YanQing wrote:
>>> Except now you're spreading the brokenness that is console_lock()
>>> over many more source files than the single-use case of
>>> do_take_over_console().
>>
>>> The actual interface is take_over_console(); the _workaround_ is
>>> exposing do_take_over_console() for fbcon to wrap.
>>
>> This _workaround_ willn't work, take_over_console will hold console_lock internal,
>> but do_take_over_console need caller hold console_lock, then we can't rewrite
>> do_take_over_console as a wrap base on take_over_console.

The workaround I'm referring to is commit 50e244cc793 which
exposed do_take_over_console() as an interface to band aid the lock
problems.

I'm ok with take_over_console() being a lock wrapper around
do_take_over_console(), if you are trying to preserve your
other changes.

Regards,
Peter Hurley
