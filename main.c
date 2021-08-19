#include <stdio.h>
#include <string.h>

void *amemmove(void *, void *, size_t);

void rand_fill_buf(void *buf, size_t n)
{
	char *cbuf = (char *) buf;

	for (size_t i = 0; i < n; ++i) {
		cbuf[i] = 'a' + rand() % 26;
	}
}

int main()
{
	char buf1[64];
	char buf2[64];
	void *dest1 = buf1 + 16;
	void *dest2 = buf2 + 16;
	const char *src = "Another test...";
	size_t n = 8;

	rand_fill_buf(buf1, 64);
	buf1[63] = 0;
	memcpy(buf2, buf1, 64);
	printf("%p %p\n", amemmove(dest1, src, n), dest1);
	printf("%p %p\n", memmove(dest2, src, n), dest2);
	printf("%s\n%s\n", buf1, buf2);
	printf("%d\n", memcmp(buf1, buf2, 64));
}