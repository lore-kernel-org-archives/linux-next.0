From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warnings after merge of the ftrace tree
Date: Mon, 4 Jul 2016 15:42:07 +1000
Message-ID: <20160704154207.159b102a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:53594 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750757AbcGDFmL (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 4 Jul 2016 01:42:11 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Steven,

After merging the ftrace tree, today's linux-next build (x86_64
allmodconfig) produced these warnings:

WARNING: kernel/trace/libftrace.o(.text+0x9569): Section mismatch in reference from the function ftrace_init_tracefs() to the variable .init.data:function_stats
The function ftrace_init_tracefs() references
the variable __initdata function_stats.
This is often because ftrace_init_tracefs lacks a __initdata 
annotation or the annotation of function_stats is wrong.

WARNING: kernel/trace/libftrace.o(.text+0x9577): Section mismatch in reference from the function ftrace_init_tracefs() to the variable .init.data:function_stats
The function ftrace_init_tracefs() references
the variable __initdata function_stats.
This is often because ftrace_init_tracefs lacks a __initdata 
annotation or the annotation of function_stats is wrong.

WARNING: kernel/trace/libftrace.o(.text+0x9582): Section mismatch in reference from the function ftrace_init_tracefs() to the variable .init.data:function_stats
The function ftrace_init_tracefs() references
the variable __initdata function_stats.
This is often because ftrace_init_tracefs lacks a __initdata 
annotation or the annotation of function_stats is wrong.

WARNING: kernel/trace/libftrace.o(.text+0x958d): Section mismatch in reference from the function ftrace_init_tracefs() to the (unknown reference) .init.data:(unknown)
The function ftrace_init_tracefs() references
the (unknown reference) __initdata (unknown).
This is often because ftrace_init_tracefs lacks a __initdata 
annotation or the annotation of (unknown) is wrong.

WARNING: kernel/trace/libftrace.o(.text+0x9598): Section mismatch in reference from the function ftrace_init_tracefs() to the (unknown reference) .init.data:(unknown)
The function ftrace_init_tracefs() references
the (unknown reference) __initdata (unknown).
This is often because ftrace_init_tracefs lacks a __initdata 
annotation or the annotation of (unknown) is wrong.

WARNING: kernel/trace/libftrace.o(.text+0x95a3): Section mismatch in reference from the function ftrace_init_tracefs() to the (unknown reference) .init.data:(unknown)
The function ftrace_init_tracefs() references
the (unknown reference) __initdata (unknown).
This is often because ftrace_init_tracefs lacks a __initdata 
annotation or the annotation of (unknown) is wrong.

WARNING: kernel/trace/libftrace.o(.text+0x95ae): Section mismatch in reference from the function ftrace_init_tracefs() to the variable .init.data:ftrace_filter_param
The function ftrace_init_tracefs() references
the variable __initdata ftrace_filter_param.
This is often because ftrace_init_tracefs lacks a __initdata 
annotation or the annotation of ftrace_filter_param is wrong.

WARNING: kernel/trace/built-in.o(.text+0x9789): Section mismatch in reference from the function ftrace_init_tracefs() to the variable .init.data:function_stats
The function ftrace_init_tracefs() references
the variable __initdata function_stats.
This is often because ftrace_init_tracefs lacks a __initdata 
annotation or the annotation of function_stats is wrong.

WARNING: kernel/trace/built-in.o(.text+0x9797): Section mismatch in reference from the function ftrace_init_tracefs() to the variable .init.data:function_stats
The function ftrace_init_tracefs() references
the variable __initdata function_stats.
This is often because ftrace_init_tracefs lacks a __initdata 
annotation or the annotation of function_stats is wrong.

WARNING: kernel/trace/built-in.o(.text+0x97a2): Section mismatch in reference from the function ftrace_init_tracefs() to the variable .init.data:function_stats
The function ftrace_init_tracefs() references
the variable __initdata function_stats.
This is often because ftrace_init_tracefs lacks a __initdata 
annotation or the annotation of function_stats is wrong.

WARNING: kernel/trace/built-in.o(.text+0x97ad): Section mismatch in reference from the function ftrace_init_tracefs() to the (unknown reference) .init.data:(unknown)
The function ftrace_init_tracefs() references
the (unknown reference) __initdata (unknown).
This is often because ftrace_init_tracefs lacks a __initdata 
annotation or the annotation of (unknown) is wrong.

WARNING: kernel/trace/built-in.o(.text+0x97b8): Section mismatch in reference from the function ftrace_init_tracefs() to the (unknown reference) .init.data:(unknown)
The function ftrace_init_tracefs() references
the (unknown reference) __initdata (unknown).
This is often because ftrace_init_tracefs lacks a __initdata 
annotation or the annotation of (unknown) is wrong.

WARNING: kernel/trace/built-in.o(.text+0x97c3): Section mismatch in reference from the function ftrace_init_tracefs() to the (unknown reference) .init.data:(unknown)
The function ftrace_init_tracefs() references
the (unknown reference) __initdata (unknown).
This is often because ftrace_init_tracefs lacks a __initdata 
annotation or the annotation of (unknown) is wrong.

WARNING: kernel/trace/built-in.o(.text+0x97ce): Section mismatch in reference from the function ftrace_init_tracefs() to the variable .init.data:ftrace_filter_param
The function ftrace_init_tracefs() references
the variable __initdata ftrace_filter_param.
This is often because ftrace_init_tracefs lacks a __initdata 
annotation or the annotation of ftrace_filter_param is wrong.

WARNING: kernel/built-in.o(.text+0x18bbb9): Section mismatch in reference from the function ftrace_init_tracefs() to the variable .init.data:function_stats
The function ftrace_init_tracefs() references
the variable __initdata function_stats.
This is often because ftrace_init_tracefs lacks a __initdata 
annotation or the annotation of function_stats is wrong.

WARNING: kernel/built-in.o(.text+0x18bbc7): Section mismatch in reference from the function ftrace_init_tracefs() to the variable .init.data:function_stats
The function ftrace_init_tracefs() references
the variable __initdata function_stats.
This is often because ftrace_init_tracefs lacks a __initdata 
annotation or the annotation of function_stats is wrong.

WARNING: kernel/built-in.o(.text+0x18bbd2): Section mismatch in reference from the function ftrace_init_tracefs() to the variable .init.data:function_stats
The function ftrace_init_tracefs() references
the variable __initdata function_stats.
This is often because ftrace_init_tracefs lacks a __initdata 
annotation or the annotation of function_stats is wrong.

WARNING: kernel/built-in.o(.text+0x18bbdd): Section mismatch in reference from the function ftrace_init_tracefs() to the (unknown reference) .init.data:(unknown)
The function ftrace_init_tracefs() references
the (unknown reference) __initdata (unknown).
This is often because ftrace_init_tracefs lacks a __initdata 
annotation or the annotation of (unknown) is wrong.

WARNING: kernel/built-in.o(.text+0x18bbe8): Section mismatch in reference from the function ftrace_init_tracefs() to the (unknown reference) .init.data:(unknown)
The function ftrace_init_tracefs() references
the (unknown reference) __initdata (unknown).
This is often because ftrace_init_tracefs lacks a __initdata 
annotation or the annotation of (unknown) is wrong.

WARNING: kernel/built-in.o(.text+0x18bbf3): Section mismatch in reference from the function ftrace_init_tracefs() to the (unknown reference) .init.data:(unknown)
The function ftrace_init_tracefs() references
the (unknown reference) __initdata (unknown).
This is often because ftrace_init_tracefs lacks a __initdata 
annotation or the annotation of (unknown) is wrong.

WARNING: kernel/built-in.o(.text+0x18bbfe): Section mismatch in reference from the function ftrace_init_tracefs() to the variable .init.data:ftrace_filter_param
The function ftrace_init_tracefs() references
the variable __initdata ftrace_filter_param.
This is often because ftrace_init_tracefs lacks a __initdata 
annotation or the annotation of ftrace_filter_param is wrong.

WARNING: vmlinux.o(.text+0x2636f9): Section mismatch in reference from the function ftrace_init_tracefs() to the variable .init.data:function_stats
The function ftrace_init_tracefs() references
the variable __initdata function_stats.
This is often because ftrace_init_tracefs lacks a __initdata 
annotation or the annotation of function_stats is wrong.

WARNING: vmlinux.o(.text+0x263707): Section mismatch in reference from the function ftrace_init_tracefs() to the variable .init.data:function_stats
The function ftrace_init_tracefs() references
the variable __initdata function_stats.
This is often because ftrace_init_tracefs lacks a __initdata 
annotation or the annotation of function_stats is wrong.

WARNING: vmlinux.o(.text+0x263712): Section mismatch in reference from the function ftrace_init_tracefs() to the variable .init.data:function_stats
The function ftrace_init_tracefs() references
the variable __initdata function_stats.
This is often because ftrace_init_tracefs lacks a __initdata 
annotation or the annotation of function_stats is wrong.

WARNING: vmlinux.o(.text+0x26371d): Section mismatch in reference from the function ftrace_init_tracefs() to the (unknown reference) .init.data:(unknown)
The function ftrace_init_tracefs() references
the (unknown reference) __initdata (unknown).
This is often because ftrace_init_tracefs lacks a __initdata 
annotation or the annotation of (unknown) is wrong.

WARNING: vmlinux.o(.text+0x263728): Section mismatch in reference from the function ftrace_init_tracefs() to the (unknown reference) .init.data:(unknown)
The function ftrace_init_tracefs() references
the (unknown reference) __initdata (unknown).
This is often because ftrace_init_tracefs lacks a __initdata 
annotation or the annotation of (unknown) is wrong.

WARNING: vmlinux.o(.text+0x263733): Section mismatch in reference from the function ftrace_init_tracefs() to the (unknown reference) .init.data:(unknown)
The function ftrace_init_tracefs() references
the (unknown reference) __initdata (unknown).
This is often because ftrace_init_tracefs lacks a __initdata 
annotation or the annotation of (unknown) is wrong.

WARNING: vmlinux.o(.text+0x26373e): Section mismatch in reference from the function ftrace_init_tracefs() to the variable .init.data:ftrace_filter_param
The function ftrace_init_tracefs() references
the variable __initdata ftrace_filter_param.
This is often because ftrace_init_tracefs lacks a __initdata 
annotation or the annotation of ftrace_filter_param is wrong.

Introduced (I assume) by commit

  345ddcc882d8 ("ftrace: Have set_ftrace_pid use the bitmap like events do")

-- 
Cheers,
Stephen Rothwell
