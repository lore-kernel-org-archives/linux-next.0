From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: driver-core tree build warning
Date: Tue, 19 Jan 2010 13:04:17 -0800
Message-ID: <20100119210417.GC10928@kroah.com>
References: <20100119172741.2dd81553.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1755857Ab0ASVTe@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20100119172741.2dd81553.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Andi Kleen <andi@firstfloor.org>
List-Id: linux-next.vger.kernel.org

On Tue, Jan 19, 2010 at 05:27:41PM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next build (powerpc ppc64_defconfig) produced this warning:
> 
> drivers/base/cpu.c:264: warning: initialization from incompatible pointer type
> drivers/base/cpu.c:265: warning: initialization from incompatible pointer type
> 
> Introduced by commit 380567d3dc35a62f5cc0ec640a45dfc238238417 ("sysdev:
> Convert node driver")?

No, I don't think that patch causes the warning, I can't duplicate it
here.

I don't know what patch causes that problem, as I can't duplicate it in
my tree at all.  Maybe some 'const' patch snuck in from some other tree?

strange,

greg k-h
