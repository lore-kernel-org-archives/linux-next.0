From: Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: linux-next: Tree for June 6
Date: Tue, 7 Jun 2011 10:48:57 +0100
Message-ID: <BANLkTikAq6D6RjBhxsNva7KhYRh6=UfcKw@mail.gmail.com>
References: <20110606132036.aebd73a4.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20110606132036.aebd73a4.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On 6 June 2011 04:20, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Changes since 20110603:
>
> New tree: arm-lpae

This introduced a few build failures on some ARM platforms (missing a
types.h include). I fixed up the pgtable files and the builds should
be ok in 20110607.

-- 
Catalin
