From: Ingo Molnar <mingo@kernel.org>
Subject: Re: [GIT PULL 0/8] perf/core improvements and fixes
Date: Wed, 14 Oct 2015 15:09:09 +0200
Message-ID: <20151014130909.GA26864@gmail.com>
References: <1444765303-8257-1-git-send-email-acme@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1444765303-8257-1-git-send-email-acme@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: linux-kernel@vger.kernel.org, Adrian Hunter <adrian.hunter@intel.com>, Andi Kleen <ak@linux.intel.com>, Borislav Petkov <bp@suse.de>, David Ahern <dsahern@gmail.com>, Frederic Weisbecker <fweisbec@gmail.com>, He Kuang <hekuang@huawei.com>, Jiri Olsa <jolsa@redhat.com>, linux-next@vger.kernel.org, Martin Liska <mliska@suse.cz>, Namhyung Kim <namhyung@kernel.org>, Peter Zijlstra <a.p.zijlstra@chello.nl>, Rabin Vincent <rabin.vincent@axis.com>, Stephane Eranian <eranian@google.com>, Wang Nan <wangnan0@huawei.com>, Arnaldo Carvalho de Melo <acme@redhat.com>
List-Id: linux-next.vger.kernel.org


* Arnaldo Carvalho de Melo <acme@kernel.org> wrote:

> Hi Ingo,
> 
> 	Please consider pulling.
> 
> - Arnaldo
> 
> BTW.: There are several outstanding patchkits needing review and processing,
> I'll be out this week for a conference, will try and speed up processing next
> week.
> 
> The following changes since commit 0e537fef24d64f7bf3ef61a27edf64a8d9a5424c:
> 
>   Merge tag 'perf-core-for-mingo' of git://git.kernel.org/pub/scm/linux/kernel/git/acme/linux into perf/core (2015-10-08 10:52:44 +0200)
> 
> are available in the git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/acme/linux.git tags/perf-core-for-mingo
> 
> for you to fetch changes up to 3a70fcd3a4db56731f67f0189514953c74257944:
> 
>   tools build: Fix cross compile build (2015-10-13 11:59:43 -0300)
> 
> ----------------------------------------------------------------
> perf/core improvements and fixes:
> 
> User visible:
> 
> - Use the alternative with the most descriptive filename containing
>   a vmlinux file for a given build-id, providing a better title line
>   for tools such as 'annotate' (Arnaldo Carvalho de Melo)
> 
> - Remove help messages about previous right and left arrow keybidings, that
>   were repurposed for horizontal scrolling (Arnaldo Carvalho de Melo)
> 
> - Inform how to reset the symbol filter in the hists browser (top & report)
>   (Arnaldo Carvalho de Melo)
> 
> - Add 'm' key for context menu display in the hists browser, that became
>   inacessible with the repurposing of the right arrow key for horizontal
>   scrolling (Namhyung Kim)
> 
> - Use debug_frame for callchains if eh_frame is unusable (Rabin Vicent)
> 
> Build fixes:
> 
> - Fix strict-aliasing breakage with gcc 4.4 in the READ_ONCE/WRITE_ONCE code
>   adopted from the kernel tree, that builds with -fno-strict-aliasing while
>   tools/perf/ uses -Wstrict-aliasing=3 (Jiri Olsa)
> 
> - Fix unw_word_t pointer casts in code using libunwind for callchains,
>   fixing the build in at least 32-bit MIPS systems (Rabin Vicent)
> 
> - Workaround cross compile build problems related to fixdep (Jiri Olsa)
> 
> Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
> 
> ----------------------------------------------------------------
> Arnaldo Carvalho de Melo (3):
>       perf symbols: Try the .debug/ DSO cache as a last resort
>       perf ui browsers: Remove help messages about use of right and arrow keys
>       perf hists browser: Inform how to reset the symbol filter
> 
> Jiri Olsa (2):
>       tools include: Fix strict-aliasing rules breakage
>       tools build: Fix cross compile build
> 
> Namhyung Kim (1):
>       perf hists browser: Add 'm' key for context menu display
> 
> Rabin Vincent (2):
>       perf callchain: Use debug_frame if eh_frame is unusable
>       perf callchains: Fix unw_word_t pointer casts
> 
>  tools/build/Makefile.include       |  4 ++++
>  tools/include/linux/compiler.h     | 32 ++++++++++++++++++++++++--------
>  tools/perf/ui/browsers/annotate.c  |  6 +++---
>  tools/perf/ui/browsers/hists.c     | 13 ++++++++-----
>  tools/perf/ui/browsers/map.c       |  2 +-
>  tools/perf/ui/browsers/scripts.c   |  2 +-
>  tools/perf/util/symbol.c           | 18 +++++++++---------
>  tools/perf/util/unwind-libunwind.c | 14 ++++++++------
>  8 files changed, 58 insertions(+), 33 deletions(-)

Pulled, thanks a lot Arnaldo!

	Ingo
