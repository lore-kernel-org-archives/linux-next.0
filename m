From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the kbuild tree
Date: Thu, 1 Dec 2016 10:06:08 +1100
Message-ID: <20161201100608.625b8915@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Michal Marek <mmarek@suse.cz>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>
List-Id: linux-next.vger.kernel.org

Hi Michal,

After merging the kbuild tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

WARNING: EXPORT symbol "__sw_hweight32" [vmlinux] version generation failed, symbol will not be versioned.
WARNING: EXPORT symbol "memcpy_mcsafe_unrolled" [vmlinux] version generation failed, symbol will not be versioned.
WARNING: EXPORT symbol "empty_zero_page" [vmlinux] version generation failed, symbol will not be versioned.
WARNING: EXPORT symbol "__get_user_2" [vmlinux] version generation failed, symbol will not be versioned.
WARNING: EXPORT symbol "__put_user_2" [vmlinux] version generation failed, symbol will not be versioned.
WARNING: EXPORT symbol "__fentry__" [vmlinux] version generation failed, symbol will not be versioned.
WARNING: EXPORT symbol "native_load_gs_index" [vmlinux] version generation failed, symbol will not be versioned.
WARNING: EXPORT symbol "__copy_user_nocache" [vmlinux] version generation failed, symbol will not be versioned.
WARNING: EXPORT symbol "copy_user_generic_unrolled" [vmlinux] version generation failed, symbol will not be versioned.
WARNING: EXPORT symbol "memset" [vmlinux] version generation failed, symbol will not be versioned.
WARNING: EXPORT symbol "_copy_to_user" [vmlinux] version generation failed, symbol will not be versioned.
WARNING: EXPORT symbol "__sw_hweight64" [vmlinux] version generation failed, symbol will not be versioned.
WARNING: EXPORT symbol "__put_user_1" [vmlinux] version generation failed, symbol will not be versioned.
WARNING: EXPORT symbol "__memcpy" [vmlinux] version generation failed, symbol will not be versioned.
WARNING: EXPORT symbol "memmove" [vmlinux] version generation failed, symbol will not be versioned.
WARNING: EXPORT symbol "__put_user_8" [vmlinux] version generation failed, symbol will not be versioned.
WARNING: EXPORT symbol "copy_user_generic_string" [vmlinux] version generation failed, symbol will not be versioned.
WARNING: EXPORT symbol "__get_user_4" [vmlinux] version generation failed, symbol will not be versioned.
WARNING: EXPORT symbol "clear_page" [vmlinux] version generation failed, symbol will not be versioned.
WARNING: EXPORT symbol "__memset" [vmlinux] version generation failed, symbol will not be versioned.
WARNING: EXPORT symbol "__memmove" [vmlinux] version generation failed, symbol will not be versioned.
WARNING: EXPORT symbol "copy_user_enhanced_fast_string" [vmlinux] version generation failed, symbol will not be versioned.
WARNING: EXPORT symbol "_copy_from_user" [vmlinux] version generation failed, symbol will not be versioned.
WARNING: EXPORT symbol "__get_user_1" [vmlinux] version generation failed, symbol will not be versioned.
WARNING: EXPORT symbol "phys_base" [vmlinux] version generation failed, symbol will not be versioned.
WARNING: EXPORT symbol "__get_user_8" [vmlinux] version generation failed, symbol will not be versioned.
WARNING: EXPORT symbol "copy_page" [vmlinux] version generation failed, symbol will not be versioned.
WARNING: EXPORT symbol "__put_user_4" [vmlinux] version generation failed, symbol will not be versioned.
WARNING: EXPORT symbol "memcpy" [vmlinux] version generation failed, symbol will not be versioned.

Introduced by commit

  d8c1eb86e952 ("kbuild: modpost warn if export version crc is missing")

-- 
Cheers,
Stephen Rothwell
