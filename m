From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Mar 20 (drivers/gpu/drm/i915/)
Date: Wed, 20 Mar 2019 07:39:38 -0700
Message-ID: <6a6bb676-39fc-295a-74eb-a83c439e5b22@infradead.org>
References: <20190320141849.34e569f8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190320141849.34e569f8@canb.auug.org.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>
List-Id: linux-next.vger.kernel.org

On 3/19/19 8:18 PM, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20190319:
> 

using: gcc (SUSE Linux) 4.8.5

beginning yesterday (20190319), I am seeing problems in i915_reg.h on x86_64:
(multiple instances of one macro in the header file)


../drivers/gpu/drm/i915/i915_reg.h:167:27: error: first argument to ‘__builtin_choose_expr’ not a constant
../include/linux/build_bug.h:16:45: error: bit-field ‘<anonymous>’ width not an integer constant
../drivers/gpu/drm/i915/i915_reg.h:167:27: error: first argument to ‘__builtin_choose_expr’ not a constant
../include/linux/build_bug.h:16:45: error: bit-field ‘<anonymous>’ width not an integer constant
../drivers/gpu/drm/i915/i915_reg.h:167:27: error: first argument to ‘__builtin_choose_expr’ not a constant
../include/linux/build_bug.h:16:45: error: bit-field ‘<anonymous>’ width not an integer constant
../drivers/gpu/drm/i915/i915_reg.h:167:27: error: first argument to ‘__builtin_choose_expr’ not a constant
../include/linux/build_bug.h:16:45: error: bit-field ‘<anonymous>’ width not an integer constant
../drivers/gpu/drm/i915/i915_reg.h:167:27: error: first argument to ‘__builtin_choose_expr’ not a constant
../include/linux/build_bug.h:16:45: error: bit-field ‘<anonymous>’ width not an integer constant
../drivers/gpu/drm/i915/i915_reg.h:167:27: error: first argument to ‘__builtin_choose_expr’ not a constant
../include/linux/build_bug.h:16:45: error: bit-field ‘<anonymous>’ width not an integer constant
../drivers/gpu/drm/i915/i915_reg.h:167:27: error: first argument to ‘__builtin_choose_expr’ not a constant
../include/linux/build_bug.h:16:45: error: bit-field ‘<anonymous>’ width not an integer constant
../drivers/gpu/drm/i915/i915_reg.h:167:27: error: first argument to ‘__builtin_choose_expr’ not a constant
../include/linux/build_bug.h:16:45: error: bit-field ‘<anonymous>’ width not an integer constant
../drivers/gpu/drm/i915/i915_reg.h:167:27: error: first argument to ‘__builtin_choose_expr’ not a constant
../include/linux/build_bug.h:16:45: error: bit-field ‘<anonymous>’ width not an integer constant
../drivers/gpu/drm/i915/i915_reg.h:167:27: error: first argument to ‘__builtin_choose_expr’ not a constant
../include/linux/build_bug.h:16:45: error: bit-field ‘<anonymous>’ width not an integer constant
../drivers/gpu/drm/i915/i915_reg.h:167:27: error: first argument to ‘__builtin_choose_expr’ not a constant
../include/linux/build_bug.h:16:45: error: bit-field ‘<anonymous>’ width not an integer constant
../drivers/gpu/drm/i915/i915_reg.h:167:27: error: first argument to ‘__builtin_choose_expr’ not a constant
../include/linux/build_bug.h:16:45: error: bit-field ‘<anonymous>’ width not an integer constant
../drivers/gpu/drm/i915/i915_reg.h:167:27: error: first argument to ‘__builtin_choose_expr’ not a constant
../include/linux/build_bug.h:16:45: error: bit-field ‘<anonymous>’ width not an integer constant
../drivers/gpu/drm/i915/i915_reg.h:167:27: error: first argument to ‘__builtin_choose_expr’ not a constant
../include/linux/build_bug.h:16:45: error: bit-field ‘<anonymous>’ width not an integer constant
../drivers/gpu/drm/i915/i915_reg.h:167:27: error: first argument to ‘__builtin_choose_expr’ not a constant
../include/linux/build_bug.h:16:45: error: bit-field ‘<anonymous>’ width not an integer constant
../drivers/gpu/drm/i915/i915_reg.h:167:27: error: first argument to ‘__builtin_choose_expr’ not a constant
../include/linux/build_bug.h:16:45: error: bit-field ‘<anonymous>’ width not an integer constant



-- 
~Randy
