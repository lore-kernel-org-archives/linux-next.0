From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Apr 1 (drivers/gpu/drm/i915)
Date: Tue, 01 Apr 2014 12:15:55 -0700
Message-ID: <533B106B.8090408@infradead.org>
References: <20140401183907.a5127cadbe7116261096beaa@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <intel-gfx-bounces@lists.freedesktop.org>
In-Reply-To: <20140401183907.a5127cadbe7116261096beaa@canb.auug.org.au>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
List-Id: linux-next.vger.kernel.org

On 04/01/2014 12:39 AM, Stephen Rothwell wrote:
> Hi all,
> 
> Please do not add material intended for v3.16 to your linux-next included
> branches until after v3.15-rc1 is released.
> 
> This tree still fails (more than usual) the powerpc allyesconfig build.
> 
> Changes since 20140331:
> 

for linux-next 0401 and 0331:

drivers/gpu/drm/i915/i915_cmd_parser.c:405:4: warning: format '%td' expects argument of type 'ptrdiff_t', but argument 5 has type 'long unsigned int' [-Wformat]


Just use %td without the (unsigned long) cast.


-- 
~Randy
