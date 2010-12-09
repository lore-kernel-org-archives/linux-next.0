From: Pekka Enberg <penberg@kernel.org>
Subject: Re: linux-next: build failure after merge of the slab tree
Date: Thu, 09 Dec 2010 18:25:04 +0200
Message-ID: <1291911904.29040.4.camel@jaguar>
References: <20101209140325.bec98c5c.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20101209140325.bec98c5c.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Christoph Lameter <cl@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Steven Rostedt <srostedt@redhat.com>, Richard Kennedy <richard@rsk.demon.co.uk>
List-Id: linux-next.vger.kernel.org

On Thu, 2010-12-09 at 14:03 +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the slab tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
> 
> lib/built-in.o: In function `.zlib_inflate_blob':
> (.text+0x8640): undefined reference to `.kmem_cache_alloc_notrace'
> 
> This build failure went away when I removed the lib directory from the
> object tree and rebuilt.  So I guess we have an unexpressed dependency.

Did your config change from SLAB to SLUB or something?
lib/zlib_inflate/infutil.c includes <linux/slab.h> but if your config
changes, I'm guessing it doesn't work all that well if you change the
allocator because those tracing functions are in <linux/sl{a,u}b_def.h>.

			Pekka
