From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: Re: linux-next: unsigned commits
Date: Mon, 6 Dec 2010 23:34:58 +0000
Message-ID: <20101206233458.GA3738@srcf.ucam.org>
References: <20101207103346.fbbcf099.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20101207103346.fbbcf099.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Tue, Dec 07, 2010 at 10:33:46AM +1100, Stephen Rothwell wrote:
> Hi Matthew,
> 
> Looking through the drivers-x86 tree update for linux-next today, I found
> a few commits that have no signed-off-by line ...
> 
> 8f2e88b22a4caaebcc8d5a9e00a8249fec350cf3	"Generic key reporting"
> e3a2b10707902bcf95d022a5bab8f13b26bccc64	"ACPI-ify"
> 52f4e59f269e0d3bb1d54ca654d9cbf6880e7370	"Fix some tos1900 devices"
> 64ea4efdd949c99d9206a44a43984d2e861350f1	"wwan rfkill stubs"
> 
> And I think those commit messages could do with some elaboration as well.

They're somewhat WIP - I'll shift them to a topic branch.

-- 
Matthew Garrett | mjg59@srcf.ucam.org
