From: Peter Hurley <peter@hurleysoftware.com>
Subject: Re: [PATCH] TTY:vt: convert remain take_over_console's users to do_take_over_console
Date: Tue, 21 May 2013 09:10:33 -0400
Message-ID: <519B7249.2070207@hurleysoftware.com>
References: <20130521051511.GA11435@udknight>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20130521051511.GA11435@udknight>
Sender: linux-kernel-owner@vger.kernel.org
To: Wang YanQing <udknight@gmail.com>, gregkh@linuxfoundation.org
Cc: sfr@canb.auug.org.au, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On 05/21/2013 01:15 AM, Wang YanQing wrote:
> Impact:
> 1:convert all remain take_over_console to do_take_over_console
> 2:update take_over_console to do_take_over_console in comment
>
> Commit dc9641895abb ("vt: delete unneeded functions
> register_con_driver|take_over_console") delete take_over_console,
> but forget to convert remain take_over_console's users to new API
> do_take_over_console, this patch fix it.
>
> Signed-off-by: Wang YanQing <udknight@gmail.com>
> ---
>   Sorry for my mistake, I believe I do the full
>   kernel source find|grep, but the reality is I
>   forget  take_over_console.

I would rather revert dc9641895abb which purported to delete
_unneeded_ functions than have this. Obviously the functions
were needed.

Regards,
Peter Hurley
