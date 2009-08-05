From: Boaz Harrosh <bharrosh@panasas.com>
Subject: Re: linux-next: Tree for August 5
Date: Wed, 05 Aug 2009 11:11:20 +0300
Message-ID: <4A793EA8.50306@panasas.com>
References: <20090805172337.b0688db1.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S933779AbZHEIL2@vger.kernel.org>
In-Reply-To: <20090805172337.b0688db1.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On 08/05/2009 10:23 AM, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20090804:
> 
> This tree fails to build for powerpc allyesconfig (final link problem).
> 

Above is reported for a long time. Is it related to this:
http://www.spinics.net/lists/kernel/msg921978.html

> The mfd tree gained a conflict against the input tree.
> 
> The drm tree gained a conflict against Linus' tree.
> 
> The edac-amd tree gained a conflict against Linus' tree.
> 
> ----------------------------------------------------------------------------
> 
<snip>
