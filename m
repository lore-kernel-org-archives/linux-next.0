From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: linux-next: build warning after merge of the arm tree
Date: Tue, 18 Nov 2014 11:43:20 -0800
Message-ID: <546BA158.6080900@codeaurora.org>
References: <20141118192507.39f68bb7@canb.auug.org.au> <546B9696.4030703@codeaurora.org> <20141118192103.GF4042@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20141118192103.GF4042@n2100.arm.linux.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Will Deacon <will.deacon@arm.com>, Rob Clark <robdclark@gmail.com>
List-Id: linux-next.vger.kernel.org

On 11/18/2014 11:21 AM, Russell King - ARM Linux wrote:
> On Tue, Nov 18, 2014 at 10:57:26AM -0800, Stephen Boyd wrote:
>> Urgh, I thought I fixed that but I guess I only took care of not
>> assigning it unless we actually need it. Well we can do the #ifdef
>> thing, or move to IS_ENABLED. Here's both options.
> I'd prefer the first as it increases compiler coverage.
>
> Thanks.
>

Ok I'll ship it into your patch system in a little bit with some real
commit text.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
