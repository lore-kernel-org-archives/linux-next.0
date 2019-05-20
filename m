From: Jonathan Corbet <corbet@lwn.net>
Subject: Re: linux-next: Fixes tag needs some work in the jc_docs tree
Date: Mon, 20 May 2019 15:54:23 -0600
Message-ID: <20190520155423.2ad5d16a@lwn.net>
References: <20190521074435.7a277fd6@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190521074435.7a277fd6@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Sven Eckelmann <sven@narfation.org>
List-Id: linux-next.vger.kernel.org

On Tue, 21 May 2019 07:44:35 +1000
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> In commit
> 
>   9eaa65e8aad5 ("scripts/spdxcheck.py: Add dual license subdirectory")
> 
> Fixes tag
> 
>   Fixes: 99871f2f9a4d ("scripts/spdxcheck.py: Fix path to deprecated licenses")
> 
> has these problem(s):
> 
>   - Target SHA1 does not exist
> 
> Did you mean
> 
> Fixes: e6d319f68d4d ("scripts/spdxcheck.py: Fix path to deprecated licenses")

Argh, sorry, I should have caught that.  Fixed, thanks.

jon
