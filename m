From: Peter Hurley <peter@hurleysoftware.com>
Subject: Re: [PATCH -next] ARC: Fix earlycon build breakage
Date: Tue, 03 Feb 2015 20:21:25 -0500
Message-ID: <54D17415.8070204@hurleysoftware.com>
References: <1423012132-9149-1-git-send-email-peter@hurleysoftware.com> <20150204011635.GA26214@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150204011635.GA26214@kroah.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>, Vineet Gupta <vgupta@synopsys.com>, Guenter Roeck <linux@roeck-us.net>
List-Id: linux-next.vger.kernel.org

On 02/03/2015 08:16 PM, Greg Kroah-Hartman wrote:
> On Tue, Feb 03, 2015 at 08:08:52PM -0500, Peter Hurley wrote:
>> Commit ffb7fcd66f14 ("ARC: Dynamically determine BASE_BAUD from DeviceTree")
>> breaks arc:defconfig build:
> 
> I don't see that commit id in my trees, so why send this to me?

Sorry. The earlier version of this patch was originally submitted to you,
but I forgot that since all the tty parts were cut out (at my urging :/),
it went through Vineet's tree directly.

Regards,
Peter Hurley
