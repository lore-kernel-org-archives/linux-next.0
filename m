From: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Subject: Re: linux-next: build failure after merge of the pm tree
Date: Mon, 11 Jul 2016 14:57:57 +0200
Message-ID: <1938344.AGtjz9xbvn@vostro.rjw.lan>
References: <20160711114653.066355ae@canb.auug.org.au> <20160711044817.GE14693@lahna.fi.intel.com> <20160711152955.535c88a7@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160711152955.535c88a7@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Octavian Purdila <octavian.purdila@intel.com>
List-Id: linux-next.vger.kernel.org

On Monday, July 11, 2016 03:29:55 PM Stephen Rothwell wrote:
> Hi Mika,
> 
> On Mon, 11 Jul 2016 07:48:17 +0300 Mika Westerberg <mika.westerberg@linux.intel.com> wrote:
> >
> > Looks like it is the module name (configfs.o) that confuses modpost or
> > linker. The below patch fixes it for me.
> 
> That makes sense.  Thanks.

OK, I'll apply the Mika's patch.

Thanks,
Rafael
